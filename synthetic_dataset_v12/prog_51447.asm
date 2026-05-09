; DESCRIPTION: Places a blue line segment connecting (443, 253) to (355, 239).
; PLAN: r0=443(x1), r1=253(y1), r2=355(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 253
LDI r2, 355
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
