; DESCRIPTION: Draws a cyan line from (41, 21) to (289, 131).
; PLAN: r0=41(x1), r1=21(y1), r2=289(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 21
LDI r2, 289
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
