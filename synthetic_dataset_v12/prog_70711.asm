; DESCRIPTION: Draws a black line from (401, 74) to (107, 81).
; PLAN: r0=401(x1), r1=74(y1), r2=107(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 74
LDI r2, 107
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
