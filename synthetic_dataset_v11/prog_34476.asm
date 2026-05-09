; DESCRIPTION: Draws a green line from (46, 191) to (170, 14).
; PLAN: r0=46(x1), r1=191(y1), r2=170(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 191
LDI r2, 170
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
