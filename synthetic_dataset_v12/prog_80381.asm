; DESCRIPTION: Places a yellow line segment connecting (294, 186) to (443, 45).
; PLAN: r0=294(x1), r1=186(y1), r2=443(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 186
LDI r2, 443
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
