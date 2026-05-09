; DESCRIPTION: Composite: Places a red dot at position (87, 156) then Places a yellow 89x92 rectangle at position (365, 78) then Places a magenta circle of radius 16 at center (46, 97).
; PLAN: r0=87(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=78(y), r7=89(width), r8=92(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x), r11=97(y), r12=16(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 87
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 365
LDI r6, 78
LDI r7, 89
LDI r8, 92
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 97
LDI r12, 16
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
