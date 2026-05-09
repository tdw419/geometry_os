; DESCRIPTION: Draws a cyan line from (501, 154) to (153, 205).
; PLAN: r0=501(x1), r1=154(y1), r2=153(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 154
LDI r2, 153
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
