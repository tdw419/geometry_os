; DESCRIPTION: Draws a black line from (215, 124) to (419, 50).
; PLAN: r0=215(x1), r1=124(y1), r2=419(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 124
LDI r2, 419
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
