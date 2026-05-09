; DESCRIPTION: Draws a cyan line from (9, 138) to (108, 205).
; PLAN: r0=9(x1), r1=138(y1), r2=108(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 138
LDI r2, 108
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
