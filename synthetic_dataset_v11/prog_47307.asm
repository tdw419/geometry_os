; DESCRIPTION: Renders a yellow box of size 102x63 starting at (49, 103).
; PLAN: r0=49(x), r1=103(y), r2=102(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 103
LDI r2, 102
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
