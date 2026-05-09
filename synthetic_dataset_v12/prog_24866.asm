; DESCRIPTION: Places a green line segment connecting (125, 133) to (42, 82).
; PLAN: r0=125(x1), r1=133(y1), r2=42(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 133
LDI r2, 42
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
