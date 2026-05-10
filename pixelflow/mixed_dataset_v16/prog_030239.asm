; DESCRIPTION: Draws a cyan line from (237, 227) to (224, 79).
; PLAN: r0=237(x1), r1=227(y1), r2=224(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 227
LDI r2, 224
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
