; DESCRIPTION: Renders a white box of size 93x103 starting at (113, 123).
; PLAN: r0=113(x), r1=123(y), r2=93(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 123
LDI r2, 93
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
