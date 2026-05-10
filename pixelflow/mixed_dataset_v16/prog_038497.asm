; DESCRIPTION: Draws a cyan line from (289, 88) to (273, 68).
; PLAN: r0=289(x1), r1=88(y1), r2=273(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 88
LDI r2, 273
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
