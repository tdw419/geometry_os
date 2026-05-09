; DESCRIPTION: Draws a cyan line from (78, 167) to (410, 179).
; PLAN: r0=78(x1), r1=167(y1), r2=410(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 167
LDI r2, 410
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
