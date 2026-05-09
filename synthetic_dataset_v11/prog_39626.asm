; DESCRIPTION: Places a magenta line segment connecting (12, 126) to (103, 246).
; PLAN: r0=12(x1), r1=126(y1), r2=103(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 126
LDI r2, 103
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
