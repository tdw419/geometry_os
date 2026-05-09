; DESCRIPTION: Composite: Draws a magenta rectangle at (300, 7) with width 83 and height 34 then Draws a cyan line from (257, 205) to (200, 106) then Places a purple dot at position (262, 16).
; PLAN: r0=300(x), r1=7(y), r2=83(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x1), r6=205(y1), r7=200(x2), r8=106(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=16(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 300
LDI r1, 7
LDI r2, 83
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 205
LDI r7, 200
LDI r8, 106
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 16
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
