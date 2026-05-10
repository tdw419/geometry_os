; DESCRIPTION: Composite: Renders a magenta line between points (6, 23) and (299, 88) then Places a orange 119x67 rectangle at position (99, 96) then Places a red dot at position (286, 44).
; PLAN: r0=6(x1), r1=23(y1), r2=299(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=96(y), r7=119(width), r8=67(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=286(x), r11=44(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 6
LDI r1, 23
LDI r2, 299
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 96
LDI r7, 119
LDI r8, 67
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 44
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
