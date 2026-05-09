; DESCRIPTION: Places a black line segment connecting (456, 208) to (166, 134).
; PLAN: r0=456(x1), r1=208(y1), r2=166(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 208
LDI r2, 166
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
