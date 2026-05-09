; DESCRIPTION: Draws a red line from (244, 10) to (245, 16).
; PLAN: r0=244(x1), r1=10(y1), r2=245(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 10
LDI r2, 245
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
