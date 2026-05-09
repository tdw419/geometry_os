; DESCRIPTION: Draws a cyan line from (129, 99) to (69, 199).
; PLAN: r0=129(x1), r1=99(y1), r2=69(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 99
LDI r2, 69
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
