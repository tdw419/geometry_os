; DESCRIPTION: Renders a magenta box of size 94x87 starting at (65, 18).
; PLAN: r0=65(x), r1=18(y), r2=94(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 18
LDI r2, 94
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
