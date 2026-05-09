; DESCRIPTION: Draws a cyan line from (65, 203) to (19, 109).
; PLAN: r0=65(x1), r1=203(y1), r2=19(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 203
LDI r2, 19
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
