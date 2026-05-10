; DESCRIPTION: Draws a cyan line from (293, 122) to (468, 94).
; PLAN: r0=293(x1), r1=122(y1), r2=468(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 122
LDI r2, 468
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
