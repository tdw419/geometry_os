; DESCRIPTION: Renders a magenta box of size 38x68 starting at (75, 50).
; PLAN: r0=75(x), r1=50(y), r2=38(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 50
LDI r2, 38
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
