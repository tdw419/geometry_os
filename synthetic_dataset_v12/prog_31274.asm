; DESCRIPTION: Renders a magenta box of size 27x20 starting at (361, 159).
; PLAN: r0=361(x), r1=159(y), r2=27(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 159
LDI r2, 27
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
