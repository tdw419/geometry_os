; DESCRIPTION: Renders a purple rectangular region spanning 57 by 91 at (154, 129).
; PLAN: r0=154(x), r1=129(y), r2=57(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 129
LDI r2, 57
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
