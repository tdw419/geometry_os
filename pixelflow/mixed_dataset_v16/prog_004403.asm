; DESCRIPTION: Draws a white line from (507, 244) to (474, 44).
; PLAN: r0=507(x1), r1=244(y1), r2=474(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 244
LDI r2, 474
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
