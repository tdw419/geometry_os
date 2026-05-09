; DESCRIPTION: Draws a cyan line from (505, 78) to (430, 115).
; PLAN: r0=505(x1), r1=78(y1), r2=430(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 78
LDI r2, 430
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
