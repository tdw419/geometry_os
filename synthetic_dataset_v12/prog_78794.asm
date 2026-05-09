; DESCRIPTION: Draws a cyan line from (500, 5) to (293, 170).
; PLAN: r0=500(x1), r1=5(y1), r2=293(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 5
LDI r2, 293
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
