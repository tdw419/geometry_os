; DESCRIPTION: Draws a white line from (50, 103) to (429, 196).
; PLAN: r0=50(x1), r1=103(y1), r2=429(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 103
LDI r2, 429
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
