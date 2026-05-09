; DESCRIPTION: Draws a green line from (340, 45) to (18, 238).
; PLAN: r0=340(x1), r1=45(y1), r2=18(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 45
LDI r2, 18
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
