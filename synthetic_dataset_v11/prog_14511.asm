; DESCRIPTION: Renders a green line between points (176, 14) and (230, 187).
; PLAN: r0=176(x1), r1=14(y1), r2=230(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 14
LDI r2, 230
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
