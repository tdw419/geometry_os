; DESCRIPTION: Renders a magenta box of size 94x109 starting at (129, 42).
; PLAN: r0=129(x), r1=42(y), r2=94(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 42
LDI r2, 94
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
