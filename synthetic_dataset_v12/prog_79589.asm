; DESCRIPTION: Draws a white line from (382, 68) to (50, 47).
; PLAN: r0=382(x1), r1=68(y1), r2=50(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 68
LDI r2, 50
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
