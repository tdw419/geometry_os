; DESCRIPTION: Draws a cyan line from (290, 41) to (153, 180).
; PLAN: r0=290(x1), r1=41(y1), r2=153(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 41
LDI r2, 153
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
