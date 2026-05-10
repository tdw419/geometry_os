; DESCRIPTION: Places a magenta line segment connecting (42, 76) to (209, 215).
; PLAN: r0=42(x1), r1=76(y1), r2=209(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 76
LDI r2, 209
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
