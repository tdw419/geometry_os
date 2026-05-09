; DESCRIPTION: Draws a cyan line from (454, 165) to (429, 30).
; PLAN: r0=454(x1), r1=165(y1), r2=429(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 165
LDI r2, 429
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
