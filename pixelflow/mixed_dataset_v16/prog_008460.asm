; DESCRIPTION: Draws a black line from (180, 124) to (507, 223).
; PLAN: r0=180(x1), r1=124(y1), r2=507(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 124
LDI r2, 507
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
