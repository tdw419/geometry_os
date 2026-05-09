; DESCRIPTION: Draws a cyan line from (203, 68) to (43, 158).
; PLAN: r0=203(x1), r1=68(y1), r2=43(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 68
LDI r2, 43
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
