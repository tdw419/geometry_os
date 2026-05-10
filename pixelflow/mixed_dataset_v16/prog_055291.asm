; DESCRIPTION: Renders a white line segment connecting (366, 72) to (284, 135).
; PLAN: r0=366(x1), r1=72(y1), r2=284(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 72
LDI r2, 284
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
