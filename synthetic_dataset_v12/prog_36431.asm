; DESCRIPTION: Draws a red line from (42, 244) to (128, 227).
; PLAN: r0=42(x1), r1=244(y1), r2=128(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 244
LDI r2, 128
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
