; DESCRIPTION: Draws a cyan line from (430, 240) to (11, 184).
; PLAN: r0=430(x1), r1=240(y1), r2=11(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 240
LDI r2, 11
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
