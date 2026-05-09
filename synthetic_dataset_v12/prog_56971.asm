; DESCRIPTION: Draws a cyan line from (488, 24) to (432, 11).
; PLAN: r0=488(x1), r1=24(y1), r2=432(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 24
LDI r2, 432
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
