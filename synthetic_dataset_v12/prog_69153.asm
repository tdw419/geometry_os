; DESCRIPTION: Renders a orange box of size 24x42 starting at (382, 136).
; PLAN: r0=382(x), r1=136(y), r2=24(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 136
LDI r2, 24
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
