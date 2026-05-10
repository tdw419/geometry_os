; DESCRIPTION: Places a black line segment connecting (175, 146) to (443, 141).
; PLAN: r0=175(x1), r1=146(y1), r2=443(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 146
LDI r2, 443
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
