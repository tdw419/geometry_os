; DESCRIPTION: Draws a red line from (258, 164) to (320, 52).
; PLAN: r0=258(x1), r1=164(y1), r2=320(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 164
LDI r2, 320
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
