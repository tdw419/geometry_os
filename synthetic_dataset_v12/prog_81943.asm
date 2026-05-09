; DESCRIPTION: Renders a magenta box of size 34x47 starting at (42, 20).
; PLAN: r0=42(x), r1=20(y), r2=34(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 20
LDI r2, 34
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
