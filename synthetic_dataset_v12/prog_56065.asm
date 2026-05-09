; DESCRIPTION: Places a magenta line segment connecting (82, 93) to (189, 243).
; PLAN: r0=82(x1), r1=93(y1), r2=189(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 93
LDI r2, 189
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
