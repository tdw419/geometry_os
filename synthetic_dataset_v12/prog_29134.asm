; DESCRIPTION: Draws a white line from (157, 126) to (364, 160).
; PLAN: r0=157(x1), r1=126(y1), r2=364(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 126
LDI r2, 364
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
