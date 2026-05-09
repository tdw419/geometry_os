; DESCRIPTION: Draws a white line from (141, 30) to (168, 254).
; PLAN: r0=141(x1), r1=30(y1), r2=168(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 30
LDI r2, 168
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
