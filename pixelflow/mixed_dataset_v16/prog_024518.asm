; DESCRIPTION: Renders a magenta box of size 120x48 starting at (254, 61).
; PLAN: r0=254(x), r1=61(y), r2=120(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 61
LDI r2, 120
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
