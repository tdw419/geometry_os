; DESCRIPTION: Places a orange line segment connecting (293, 215) to (265, 182).
; PLAN: r0=293(x1), r1=215(y1), r2=265(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 215
LDI r2, 265
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
