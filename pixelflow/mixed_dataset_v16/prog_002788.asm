; DESCRIPTION: Renders a magenta box of size 93x61 starting at (150, 7).
; PLAN: r0=150(x), r1=7(y), r2=93(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 7
LDI r2, 93
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
