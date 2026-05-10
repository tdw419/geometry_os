; DESCRIPTION: Draws a magenta line from (443, 236) to (450, 150).
; PLAN: r0=443(x1), r1=236(y1), r2=450(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 236
LDI r2, 450
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
