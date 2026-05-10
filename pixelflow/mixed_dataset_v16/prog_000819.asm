; DESCRIPTION: Draws a cyan line from (497, 20) to (282, 205).
; PLAN: r0=497(x1), r1=20(y1), r2=282(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 20
LDI r2, 282
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
