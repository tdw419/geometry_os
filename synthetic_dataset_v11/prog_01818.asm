; DESCRIPTION: Places a green line segment connecting (10, 39) to (125, 173).
; PLAN: r0=10(x1), r1=39(y1), r2=125(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 39
LDI r2, 125
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
