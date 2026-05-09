; DESCRIPTION: Draws a white line from (414, 206) to (328, 226).
; PLAN: r0=414(x1), r1=206(y1), r2=328(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 206
LDI r2, 328
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
