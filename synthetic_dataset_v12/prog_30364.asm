; DESCRIPTION: Draws a white line from (424, 90) to (502, 39).
; PLAN: r0=424(x1), r1=90(y1), r2=502(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 90
LDI r2, 502
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
