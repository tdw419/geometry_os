; DESCRIPTION: Draws a cyan line from (140, 185) to (146, 191).
; PLAN: r0=140(x1), r1=185(y1), r2=146(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 185
LDI r2, 146
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
