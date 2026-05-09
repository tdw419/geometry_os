; DESCRIPTION: Renders a magenta box of size 75x115 starting at (283, 27).
; PLAN: r0=283(x), r1=27(y), r2=75(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 27
LDI r2, 75
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
