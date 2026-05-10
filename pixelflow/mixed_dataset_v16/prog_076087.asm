; DESCRIPTION: Draws a cyan line from (181, 122) to (118, 171).
; PLAN: r0=181(x1), r1=122(y1), r2=118(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 122
LDI r2, 118
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
