; DESCRIPTION: Renders a cyan line between points (43, 178) and (156, 172).
; PLAN: r0=43(x1), r1=178(y1), r2=156(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 178
LDI r2, 156
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
