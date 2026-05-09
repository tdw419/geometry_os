; DESCRIPTION: Renders a magenta box of size 82x75 starting at (42, 167).
; PLAN: r0=42(x), r1=167(y), r2=82(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 167
LDI r2, 82
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
