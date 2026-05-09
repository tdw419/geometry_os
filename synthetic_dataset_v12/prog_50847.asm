; DESCRIPTION: Draws a cyan line from (28, 6) to (289, 205).
; PLAN: r0=28(x1), r1=6(y1), r2=289(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 6
LDI r2, 289
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
