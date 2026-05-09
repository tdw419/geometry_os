; DESCRIPTION: Renders a white box of size 59x93 starting at (214, 56).
; PLAN: r0=214(x), r1=56(y), r2=59(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 56
LDI r2, 59
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
