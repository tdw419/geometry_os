; DESCRIPTION: Draws a white line from (329, 168) to (52, 156).
; PLAN: r0=329(x1), r1=168(y1), r2=52(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 168
LDI r2, 52
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
