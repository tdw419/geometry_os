; DESCRIPTION: Renders a magenta line between points (42, 232) and (329, 228).
; PLAN: r0=42(x1), r1=232(y1), r2=329(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 232
LDI r2, 329
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
