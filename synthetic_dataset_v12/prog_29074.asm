; DESCRIPTION: Places a white line segment connecting (443, 50) to (8, 86).
; PLAN: r0=443(x1), r1=50(y1), r2=8(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 50
LDI r2, 8
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
