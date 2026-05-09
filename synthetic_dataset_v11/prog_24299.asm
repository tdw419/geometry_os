; DESCRIPTION: Draws a white line from (65, 5) to (109, 27).
; PLAN: r0=65(x1), r1=5(y1), r2=109(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 5
LDI r2, 109
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
