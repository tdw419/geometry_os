; DESCRIPTION: Draws a cyan line from (264, 81) to (329, 41).
; PLAN: r0=264(x1), r1=81(y1), r2=329(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 81
LDI r2, 329
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
