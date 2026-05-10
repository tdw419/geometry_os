; DESCRIPTION: Draws a purple line from (187, 126) to (443, 139).
; PLAN: r0=187(x1), r1=126(y1), r2=443(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 126
LDI r2, 443
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
