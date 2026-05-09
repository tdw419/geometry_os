; DESCRIPTION: Renders a magenta box of size 69x46 starting at (179, 173).
; PLAN: r0=179(x), r1=173(y), r2=69(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 173
LDI r2, 69
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
