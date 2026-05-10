; DESCRIPTION: Draws a cyan line from (245, 106) to (154, 155).
; PLAN: r0=245(x1), r1=106(y1), r2=154(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 106
LDI r2, 154
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
