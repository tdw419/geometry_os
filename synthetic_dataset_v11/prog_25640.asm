; DESCRIPTION: Draws a white line from (157, 91) to (42, 176).
; PLAN: r0=157(x1), r1=91(y1), r2=42(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 91
LDI r2, 42
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
