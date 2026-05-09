; DESCRIPTION: Places a magenta line segment connecting (278, 27) to (42, 18).
; PLAN: r0=278(x1), r1=27(y1), r2=42(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 27
LDI r2, 42
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
