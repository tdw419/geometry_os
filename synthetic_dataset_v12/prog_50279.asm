; DESCRIPTION: Renders a magenta box of size 50x24 starting at (10, 229).
; PLAN: r0=10(x), r1=229(y), r2=50(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 229
LDI r2, 50
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
