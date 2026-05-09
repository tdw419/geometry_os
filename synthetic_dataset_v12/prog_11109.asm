; DESCRIPTION: Draws a cyan line from (76, 171) to (366, 207).
; PLAN: r0=76(x1), r1=171(y1), r2=366(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 171
LDI r2, 366
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
