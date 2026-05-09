; DESCRIPTION: Draws a white line from (64, 151) to (68, 184).
; PLAN: r0=64(x1), r1=151(y1), r2=68(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 151
LDI r2, 68
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
