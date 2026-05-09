; DESCRIPTION: Draws a white line from (120, 8) to (210, 52).
; PLAN: r0=120(x1), r1=8(y1), r2=210(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 8
LDI r2, 210
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
