; DESCRIPTION: Places a cyan line segment connecting (209, 41) to (328, 23).
; PLAN: r0=209(x1), r1=41(y1), r2=328(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 41
LDI r2, 328
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
