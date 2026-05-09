; DESCRIPTION: Draws a magenta line from (403, 61) to (443, 42).
; PLAN: r0=403(x1), r1=61(y1), r2=443(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 61
LDI r2, 443
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
