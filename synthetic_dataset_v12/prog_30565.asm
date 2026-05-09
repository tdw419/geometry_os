; DESCRIPTION: Renders a red box of size 11x16 starting at (114, 126).
; PLAN: r0=114(x), r1=126(y), r2=11(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 126
LDI r2, 11
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
