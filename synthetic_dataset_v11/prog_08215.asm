; DESCRIPTION: Renders a white box of size 86x26 starting at (74, 95).
; PLAN: r0=74(x), r1=95(y), r2=86(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 95
LDI r2, 86
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
