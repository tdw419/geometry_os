; DESCRIPTION: Renders a magenta box of size 82x53 starting at (154, 112).
; PLAN: r0=154(x), r1=112(y), r2=82(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 112
LDI r2, 82
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
