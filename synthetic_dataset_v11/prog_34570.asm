; DESCRIPTION: Draws a white line from (174, 87) to (68, 255).
; PLAN: r0=174(x1), r1=87(y1), r2=68(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 87
LDI r2, 68
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
