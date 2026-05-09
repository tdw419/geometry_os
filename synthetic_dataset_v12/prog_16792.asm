; DESCRIPTION: Renders a magenta box of size 61x27 starting at (449, 226).
; PLAN: r0=449(x), r1=226(y), r2=61(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 226
LDI r2, 61
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
