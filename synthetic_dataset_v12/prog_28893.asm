; DESCRIPTION: Places a white line segment connecting (475, 253) to (322, 254).
; PLAN: r0=475(x1), r1=253(y1), r2=322(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 253
LDI r2, 322
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
