; DESCRIPTION: Draws a white line from (120, 150) to (209, 156).
; PLAN: r0=120(x1), r1=150(y1), r2=209(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 150
LDI r2, 209
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
