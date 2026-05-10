; DESCRIPTION: Draws a cyan line from (203, 0) to (85, 72).
; PLAN: r0=203(x1), r1=0(y1), r2=85(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 0
LDI r2, 85
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
