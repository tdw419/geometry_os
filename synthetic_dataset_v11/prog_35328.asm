; DESCRIPTION: Draws a cyan line from (234, 176) to (169, 7).
; PLAN: r0=234(x1), r1=176(y1), r2=169(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 176
LDI r2, 169
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
