; DESCRIPTION: Draws a green line from (245, 78) to (468, 209).
; PLAN: r0=245(x1), r1=78(y1), r2=468(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 78
LDI r2, 468
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
