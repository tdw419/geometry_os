; DESCRIPTION: Draws a white line from (39, 245) to (184, 95).
; PLAN: r0=39(x1), r1=245(y1), r2=184(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 245
LDI r2, 184
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
