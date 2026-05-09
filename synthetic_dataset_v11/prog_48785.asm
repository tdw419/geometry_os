; DESCRIPTION: Draws a black line from (245, 12) to (215, 191).
; PLAN: r0=245(x1), r1=12(y1), r2=215(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 12
LDI r2, 215
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
