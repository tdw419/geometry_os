; DESCRIPTION: Draws a green line from (216, 191) to (171, 230).
; PLAN: r0=216(x1), r1=191(y1), r2=171(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 191
LDI r2, 171
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
