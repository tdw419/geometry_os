; DESCRIPTION: Draws a white line from (226, 68) to (16, 97).
; PLAN: r0=226(x1), r1=68(y1), r2=16(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 68
LDI r2, 16
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
