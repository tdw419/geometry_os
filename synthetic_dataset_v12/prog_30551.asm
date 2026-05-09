; DESCRIPTION: Draws a cyan line from (178, 64) to (50, 41).
; PLAN: r0=178(x1), r1=64(y1), r2=50(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 64
LDI r2, 50
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
