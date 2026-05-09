; DESCRIPTION: Draws a white line from (91, 215) to (28, 212).
; PLAN: r0=91(x1), r1=215(y1), r2=28(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 215
LDI r2, 28
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
