; DESCRIPTION: Draws a white line from (414, 205) to (241, 60).
; PLAN: r0=414(x1), r1=205(y1), r2=241(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 205
LDI r2, 241
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
