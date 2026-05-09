; DESCRIPTION: Draws a white line from (245, 21) to (81, 133).
; PLAN: r0=245(x1), r1=21(y1), r2=81(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 21
LDI r2, 81
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
