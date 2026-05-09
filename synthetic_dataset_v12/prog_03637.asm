; DESCRIPTION: Renders a blue box of size 91x38 starting at (148, 103).
; PLAN: r0=148(x), r1=103(y), r2=91(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 103
LDI r2, 91
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
