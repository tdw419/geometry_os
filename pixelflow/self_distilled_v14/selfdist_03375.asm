; DESCRIPTION: Draws a green line from (182, 30) to (52, 167).
; PLAN: r0=182(x1), r1=30(y1), r2=52(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 30
LDI r2, 52
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
