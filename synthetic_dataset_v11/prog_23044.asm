; DESCRIPTION: Draws a cyan line from (216, 203) to (1, 45).
; PLAN: r0=216(x1), r1=203(y1), r2=1(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 203
LDI r2, 1
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
