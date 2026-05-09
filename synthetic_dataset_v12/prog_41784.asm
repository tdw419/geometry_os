; DESCRIPTION: Draws a white line from (68, 62) to (413, 186).
; PLAN: r0=68(x1), r1=62(y1), r2=413(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 62
LDI r2, 413
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
