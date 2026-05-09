; DESCRIPTION: Draws a purple line from (380, 82) to (214, 193).
; PLAN: r0=380(x1), r1=82(y1), r2=214(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 82
LDI r2, 214
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
