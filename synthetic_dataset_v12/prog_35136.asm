; DESCRIPTION: Composite: Creates a cyan circular shape at (164, 184) with radius 22 then Draws a green line from (16, 203) to (1, 228) then Places a red dot at position (396, 155).
; PLAN: r0=164(x), r1=184(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x1), r6=203(y1), r7=1(x2), r8=228(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=155(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 184
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 203
LDI r7, 1
LDI r8, 228
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 155
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
