; DESCRIPTION: Draws a green line from (275, 81) to (17, 234).
; PLAN: r0=275(x1), r1=81(y1), r2=17(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 81
LDI r2, 17
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
