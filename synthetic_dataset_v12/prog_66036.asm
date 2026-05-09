; DESCRIPTION: Places a green line segment connecting (228, 63) to (82, 153).
; PLAN: r0=228(x1), r1=63(y1), r2=82(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 63
LDI r2, 82
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
