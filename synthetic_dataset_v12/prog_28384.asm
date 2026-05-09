; DESCRIPTION: Draws a cyan line from (497, 112) to (409, 24).
; PLAN: r0=497(x1), r1=112(y1), r2=409(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 112
LDI r2, 409
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
