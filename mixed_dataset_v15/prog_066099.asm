; DESCRIPTION: Places a white line segment connecting (437, 141) to (499, 168).
; PLAN: r0=437(x1), r1=141(y1), r2=499(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 141
LDI r2, 499
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
