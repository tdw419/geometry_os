; DESCRIPTION: Draws a cyan line from (488, 85) to (355, 3).
; PLAN: r0=488(x1), r1=85(y1), r2=355(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 85
LDI r2, 355
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
