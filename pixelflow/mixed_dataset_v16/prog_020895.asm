; DESCRIPTION: Renders a purple rectangular region spanning 95 by 85 at (284, 158).
; PLAN: r0=284(x), r1=158(y), r2=95(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 158
LDI r2, 95
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
