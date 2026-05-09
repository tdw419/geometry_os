; DESCRIPTION: Composite: . Then Renders a yellow box of size 35x96 starting at (114, 76). Then Places a black line segment connecting (104, 5) to (182, 28).
; PLAN: r0=114(x), r1=76(y), r2=35(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x1), r1=5(y1), r2=182(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 35x96 starting at (114, 76).
; PLAN: r0=114(x), r1=76(y), r2=35(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 76
LDI r2, 35
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (104, 5) to (182, 28).
; PLAN: r0=104(x1), r1=5(y1), r2=182(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 5
LDI r2, 182
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
