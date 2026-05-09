; DESCRIPTION: Draws a cyan line from (216, 12) to (11, 232).
; PLAN: r0=216(x1), r1=12(y1), r2=11(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 12
LDI r2, 11
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
