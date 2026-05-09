; DESCRIPTION: Draws a white line from (291, 176) to (66, 248).
; PLAN: r0=291(x1), r1=176(y1), r2=66(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 176
LDI r2, 66
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
