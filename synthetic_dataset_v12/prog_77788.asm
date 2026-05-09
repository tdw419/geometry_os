; DESCRIPTION: Composite: Draws a cyan line from (156, 233) to (131, 96) then Places a yellow 40x36 rectangle at position (173, 14) then Places a blue dot at position (218, 130).
; PLAN: r0=156(x1), r1=233(y1), r2=131(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=14(y), r7=40(width), r8=36(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=218(x), r11=130(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 233
LDI r2, 131
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 14
LDI r7, 40
LDI r8, 36
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 130
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
