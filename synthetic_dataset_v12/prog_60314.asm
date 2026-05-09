; DESCRIPTION: Renders a magenta box of size 50x72 starting at (265, 161).
; PLAN: r0=265(x), r1=161(y), r2=50(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 161
LDI r2, 50
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
