; DESCRIPTION: Draws a white line from (43, 253) to (304, 108).
; PLAN: r0=43(x1), r1=253(y1), r2=304(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 253
LDI r2, 304
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
