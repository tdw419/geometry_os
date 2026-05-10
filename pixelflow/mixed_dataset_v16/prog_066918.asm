; DESCRIPTION: Draws a white line from (372, 57) to (269, 204).
; PLAN: r0=372(x1), r1=57(y1), r2=269(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 57
LDI r2, 269
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
