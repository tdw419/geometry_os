; DESCRIPTION: Renders a magenta box of size 65x62 starting at (394, 69).
; PLAN: r0=394(x), r1=69(y), r2=65(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 69
LDI r2, 65
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
