; DESCRIPTION: Draws a white line from (294, 219) to (153, 212).
; PLAN: r0=294(x1), r1=219(y1), r2=153(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 219
LDI r2, 153
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
