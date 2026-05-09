; DESCRIPTION: Renders a purple box of size 69x46 starting at (154, 154).
; PLAN: r0=154(x), r1=154(y), r2=69(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 154
LDI r2, 69
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
