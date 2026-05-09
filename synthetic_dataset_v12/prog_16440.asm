; DESCRIPTION: Draws a magenta line from (443, 180) to (67, 120).
; PLAN: r0=443(x1), r1=180(y1), r2=67(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 180
LDI r2, 67
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
