; DESCRIPTION: Renders a white box of size 57x27 starting at (72, 148).
; PLAN: r0=72(x), r1=148(y), r2=57(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 148
LDI r2, 57
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
