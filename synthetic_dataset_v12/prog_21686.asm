; DESCRIPTION: Renders a magenta box of size 113x25 starting at (42, 53).
; PLAN: r0=42(x), r1=53(y), r2=113(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 53
LDI r2, 113
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
