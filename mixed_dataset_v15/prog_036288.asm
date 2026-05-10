; DESCRIPTION: Draws a cyan line from (497, 238) to (428, 244).
; PLAN: r0=497(x1), r1=238(y1), r2=428(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 238
LDI r2, 428
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
