; DESCRIPTION: Draws a white line from (267, 47) to (154, 176).
; PLAN: r0=267(x1), r1=47(y1), r2=154(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 47
LDI r2, 154
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
