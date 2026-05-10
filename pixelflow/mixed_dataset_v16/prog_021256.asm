; DESCRIPTION: Renders a magenta rectangular region spanning 101 by 91 at (284, 154).
; PLAN: r0=284(x), r1=154(y), r2=101(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 154
LDI r2, 101
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
