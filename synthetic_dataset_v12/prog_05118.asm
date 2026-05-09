; DESCRIPTION: Places a cyan line segment connecting (204, 159) to (64, 41).
; PLAN: r0=204(x1), r1=159(y1), r2=64(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 159
LDI r2, 64
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
