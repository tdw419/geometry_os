; DESCRIPTION: Draws a red line from (215, 49) to (161, 124).
; PLAN: r0=215(x1), r1=49(y1), r2=161(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 49
LDI r2, 161
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
