; DESCRIPTION: Renders a black box of size 102x60 starting at (267, 30).
; PLAN: r0=267(x), r1=30(y), r2=102(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 30
LDI r2, 102
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
