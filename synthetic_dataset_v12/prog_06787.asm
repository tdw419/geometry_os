; DESCRIPTION: Draws a cyan line from (66, 172) to (109, 175).
; PLAN: r0=66(x1), r1=172(y1), r2=109(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 172
LDI r2, 109
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
