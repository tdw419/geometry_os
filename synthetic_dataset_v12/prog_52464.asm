; DESCRIPTION: Composite: Places a blue dot at position (219, 84) then Renders a yellow box of size 89x73 starting at (305, 114) then Draws a red circle centered at (208, 77) with radius 41.
; PLAN: r0=219(x), r1=84(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=114(y), r7=89(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=77(y), r12=41(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 219
LDI r1, 84
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 114
LDI r7, 89
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 77
LDI r12, 41
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
