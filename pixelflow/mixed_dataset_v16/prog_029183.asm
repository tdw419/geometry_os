; DESCRIPTION: Places a cyan line segment connecting (239, 103) to (41, 71).
; PLAN: r0=239(x1), r1=103(y1), r2=41(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 103
LDI r2, 41
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
