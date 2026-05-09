; DESCRIPTION: Places a magenta line segment connecting (329, 114) to (487, 42).
; PLAN: r0=329(x1), r1=114(y1), r2=487(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 114
LDI r2, 487
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
