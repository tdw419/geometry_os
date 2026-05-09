; DESCRIPTION: Renders a magenta box of size 103x50 starting at (142, 170).
; PLAN: r0=142(x), r1=170(y), r2=103(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 170
LDI r2, 103
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
