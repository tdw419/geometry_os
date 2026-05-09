; DESCRIPTION: Draws a cyan line from (41, 165) to (48, 44).
; PLAN: r0=41(x1), r1=165(y1), r2=48(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 165
LDI r2, 48
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
