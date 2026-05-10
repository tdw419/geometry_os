; DESCRIPTION: Places a white line segment connecting (207, 28) to (453, 103).
; PLAN: r0=207(x1), r1=28(y1), r2=453(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 28
LDI r2, 453
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
