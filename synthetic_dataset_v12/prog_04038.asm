; DESCRIPTION: Draws a white line from (443, 90) to (406, 69).
; PLAN: r0=443(x1), r1=90(y1), r2=406(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 90
LDI r2, 406
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
