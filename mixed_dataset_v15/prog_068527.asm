; DESCRIPTION: Draws a green line from (214, 202) to (6, 7).
; PLAN: r0=214(x1), r1=202(y1), r2=6(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 202
LDI r2, 6
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
