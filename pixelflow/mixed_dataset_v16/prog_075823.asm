; DESCRIPTION: Draws a cyan line from (41, 220) to (244, 224).
; PLAN: r0=41(x1), r1=220(y1), r2=244(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 220
LDI r2, 244
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
