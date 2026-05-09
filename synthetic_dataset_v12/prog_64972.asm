; DESCRIPTION: Places a purple line segment connecting (443, 194) to (215, 221).
; PLAN: r0=443(x1), r1=194(y1), r2=215(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 194
LDI r2, 215
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
