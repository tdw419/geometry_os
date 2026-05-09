; DESCRIPTION: Draws a cyan line from (169, 106) to (63, 195).
; PLAN: r0=169(x1), r1=106(y1), r2=63(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 106
LDI r2, 63
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
