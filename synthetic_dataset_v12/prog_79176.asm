; DESCRIPTION: Draws a white line from (297, 213) to (66, 65).
; PLAN: r0=297(x1), r1=213(y1), r2=66(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 213
LDI r2, 66
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
