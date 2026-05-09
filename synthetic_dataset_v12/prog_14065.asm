; DESCRIPTION: Draws a cyan line from (126, 171) to (41, 22).
; PLAN: r0=126(x1), r1=171(y1), r2=41(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 171
LDI r2, 41
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
