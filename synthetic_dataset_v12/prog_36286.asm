; DESCRIPTION: Draws a cyan line from (383, 214) to (85, 122).
; PLAN: r0=383(x1), r1=214(y1), r2=85(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 214
LDI r2, 85
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
