; DESCRIPTION: Draws a white line from (276, 196) to (150, 44).
; PLAN: r0=276(x1), r1=196(y1), r2=150(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 196
LDI r2, 150
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
