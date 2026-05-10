; DESCRIPTION: Renders a purple line between points (281, 214) and (258, 187).
; PLAN: r0=281(x1), r1=214(y1), r2=258(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 214
LDI r2, 258
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
