; DESCRIPTION: Places a black line segment connecting (284, 196) to (198, 110).
; PLAN: r0=284(x1), r1=196(y1), r2=198(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 196
LDI r2, 198
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
