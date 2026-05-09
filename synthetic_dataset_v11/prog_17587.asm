; DESCRIPTION: Draws a cyan line from (145, 224) to (71, 77).
; PLAN: r0=145(x1), r1=224(y1), r2=71(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 224
LDI r2, 71
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
