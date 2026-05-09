; DESCRIPTION: Renders a white box of size 103x80 starting at (53, 56).
; PLAN: r0=53(x), r1=56(y), r2=103(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 56
LDI r2, 103
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
