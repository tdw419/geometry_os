; DESCRIPTION: Places a green line segment connecting (41, 228) to (107, 129).
; PLAN: r0=41(x1), r1=228(y1), r2=107(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 228
LDI r2, 107
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
