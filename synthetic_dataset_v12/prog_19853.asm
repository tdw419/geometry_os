; DESCRIPTION: Renders a magenta box of size 10x50 starting at (380, 96).
; PLAN: r0=380(x), r1=96(y), r2=10(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 96
LDI r2, 10
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
