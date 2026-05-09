; DESCRIPTION: Draws a cyan line from (157, 140) to (183, 130).
; PLAN: r0=157(x1), r1=140(y1), r2=183(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 140
LDI r2, 183
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
