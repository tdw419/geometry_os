; DESCRIPTION: Composite: Renders a orange box of size 48x113 starting at (196, 29) then Renders a orange line between points (310, 87) and (98, 212) then Places a yellow dot at position (356, 237).
; PLAN: r0=196(x), r1=29(y), r2=48(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x1), r6=87(y1), r7=98(x2), r8=212(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=237(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 29
LDI r2, 48
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 87
LDI r7, 98
LDI r8, 212
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 237
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
