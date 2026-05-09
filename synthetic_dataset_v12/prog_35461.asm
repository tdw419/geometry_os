; DESCRIPTION: Renders a red box of size 26x42 starting at (368, 157).
; PLAN: r0=368(x), r1=157(y), r2=26(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 157
LDI r2, 26
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
