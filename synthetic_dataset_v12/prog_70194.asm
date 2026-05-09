; DESCRIPTION: Draws a cyan line from (99, 47) to (414, 13).
; PLAN: r0=99(x1), r1=47(y1), r2=414(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 47
LDI r2, 414
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
