; DESCRIPTION: Places a black line segment connecting (166, 103) to (401, 253).
; PLAN: r0=166(x1), r1=103(y1), r2=401(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 103
LDI r2, 401
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
