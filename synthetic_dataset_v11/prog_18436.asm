; DESCRIPTION: Composite: . Then Places a black line segment connecting (13, 239) to (77, 1). Then Renders a yellow box of size 77x45 starting at (171, 49).
; PLAN: r0=13(x1), r1=239(y1), r2=77(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=171(x), r1=49(y), r2=77(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (13, 239) to (77, 1).
; PLAN: r0=13(x1), r1=239(y1), r2=77(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 239
LDI r2, 77
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 77x45 starting at (171, 49).
; PLAN: r0=171(x), r1=49(y), r2=77(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 49
LDI r2, 77
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
