; DESCRIPTION: Renders a white box of size 86x95 starting at (28, 32).
; PLAN: r0=28(x), r1=32(y), r2=86(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 32
LDI r2, 86
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
