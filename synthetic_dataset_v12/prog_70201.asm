; DESCRIPTION: Renders a magenta line between points (178, 42) and (128, 228).
; PLAN: r0=178(x1), r1=42(y1), r2=128(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 42
LDI r2, 128
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
