; DESCRIPTION: Composite: Renders a green box of size 39x108 starting at (305, 4) then Places a yellow dot at position (100, 171) then Places a black line segment connecting (193, 5) to (76, 119).
; PLAN: r0=305(x), r1=4(y), r2=39(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=171(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=193(x1), r11=5(y1), r12=76(x2), r13=119(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 4
LDI r2, 39
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 171
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 193
LDI r11, 5
LDI r12, 76
LDI r13, 119
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
