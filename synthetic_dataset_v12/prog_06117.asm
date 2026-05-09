; DESCRIPTION: Draws a green line from (361, 206) to (399, 253).
; PLAN: r0=361(x1), r1=206(y1), r2=399(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 206
LDI r2, 399
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
