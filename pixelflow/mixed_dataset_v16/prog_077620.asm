; DESCRIPTION: Places a white line segment connecting (416, 168) to (511, 83).
; PLAN: r0=416(x1), r1=168(y1), r2=511(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 168
LDI r2, 511
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
