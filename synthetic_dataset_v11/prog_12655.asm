; DESCRIPTION: Renders a white box of size 61x58 starting at (35, 163).
; PLAN: r0=35(x), r1=163(y), r2=61(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 163
LDI r2, 61
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
