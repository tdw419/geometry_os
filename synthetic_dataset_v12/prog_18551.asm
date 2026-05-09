; DESCRIPTION: Draws a orange line from (382, 139) to (215, 117).
; PLAN: r0=382(x1), r1=139(y1), r2=215(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 139
LDI r2, 215
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
