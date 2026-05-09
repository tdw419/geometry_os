; DESCRIPTION: Draws a white line from (321, 80) to (228, 44).
; PLAN: r0=321(x1), r1=80(y1), r2=228(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 80
LDI r2, 228
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
