; DESCRIPTION: Places a white line segment connecting (384, 104) to (384, 202).
; PLAN: r0=384(x1), r1=104(y1), r2=384(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 104
LDI r2, 384
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
