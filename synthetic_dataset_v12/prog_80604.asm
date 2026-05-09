; DESCRIPTION: Draws a cyan line from (491, 212) to (459, 115).
; PLAN: r0=491(x1), r1=212(y1), r2=459(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 212
LDI r2, 459
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
