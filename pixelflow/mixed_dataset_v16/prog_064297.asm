; DESCRIPTION: Draws a cyan line from (171, 97) to (292, 102).
; PLAN: r0=171(x1), r1=97(y1), r2=292(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 97
LDI r2, 292
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
