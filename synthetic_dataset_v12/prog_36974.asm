; DESCRIPTION: Places a green line segment connecting (443, 113) to (91, 60).
; PLAN: r0=443(x1), r1=113(y1), r2=91(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 113
LDI r2, 91
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
