; DESCRIPTION: Places a cyan line segment connecting (265, 160) to (242, 41).
; PLAN: r0=265(x1), r1=160(y1), r2=242(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 160
LDI r2, 242
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
