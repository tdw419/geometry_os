; DESCRIPTION: Draws a white line from (247, 40) to (66, 71).
; PLAN: r0=247(x1), r1=40(y1), r2=66(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 40
LDI r2, 66
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
