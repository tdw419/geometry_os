; DESCRIPTION: Draws a green line from (186, 26) to (461, 27).
; PLAN: r0=186(x1), r1=26(y1), r2=461(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 26
LDI r2, 461
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
