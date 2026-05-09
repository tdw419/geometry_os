; DESCRIPTION: Draws a cyan line from (44, 71) to (63, 169).
; PLAN: r0=44(x1), r1=71(y1), r2=63(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 71
LDI r2, 63
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
