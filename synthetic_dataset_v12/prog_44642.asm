; DESCRIPTION: Places a white line segment connecting (132, 27) to (401, 202).
; PLAN: r0=132(x1), r1=27(y1), r2=401(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 27
LDI r2, 401
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
