; DESCRIPTION: Places a white line segment connecting (315, 176) to (405, 83).
; PLAN: r0=315(x1), r1=176(y1), r2=405(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 176
LDI r2, 405
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
