; DESCRIPTION: Places a black line segment connecting (415, 11) to (328, 221).
; PLAN: r0=415(x1), r1=11(y1), r2=328(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 11
LDI r2, 328
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
