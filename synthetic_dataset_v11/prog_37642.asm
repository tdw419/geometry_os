; DESCRIPTION: Composite: . Then Places a blue line segment connecting (218, 213) to (36, 222). Then Places a white circle of radius 18 at center (67, 95).
; PLAN: r0=218(x1), r1=213(y1), r2=36(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=95(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (218, 213) to (36, 222).
; PLAN: r0=218(x1), r1=213(y1), r2=36(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 213
LDI r2, 36
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 18 at center (67, 95).
; PLAN: r0=67(x), r1=95(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 95
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
