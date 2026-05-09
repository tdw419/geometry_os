; DESCRIPTION: Draws a green line from (214, 74) to (15, 71).
; PLAN: r0=214(x1), r1=74(y1), r2=15(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 74
LDI r2, 15
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
