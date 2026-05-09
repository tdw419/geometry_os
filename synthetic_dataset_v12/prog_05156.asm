; DESCRIPTION: Draws a cyan line from (314, 105) to (224, 171).
; PLAN: r0=314(x1), r1=105(y1), r2=224(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 105
LDI r2, 224
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
