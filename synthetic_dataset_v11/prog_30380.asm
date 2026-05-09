; DESCRIPTION: Renders a white box of size 27x106 starting at (168, 148).
; PLAN: r0=168(x), r1=148(y), r2=27(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 148
LDI r2, 27
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
