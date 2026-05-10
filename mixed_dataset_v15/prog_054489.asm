; DESCRIPTION: Renders a yellow line between points (486, 207) and (215, 126).
; PLAN: r0=486(x1), r1=207(y1), r2=215(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 207
LDI r2, 215
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
