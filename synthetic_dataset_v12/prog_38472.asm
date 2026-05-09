; DESCRIPTION: Draws a yellow line from (485, 163) to (396, 226).
; PLAN: r0=485(x1), r1=163(y1), r2=396(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 163
LDI r2, 396
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
