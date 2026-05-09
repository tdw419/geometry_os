; DESCRIPTION: Renders a red box of size 82x10 starting at (170, 126).
; PLAN: r0=170(x), r1=126(y), r2=82(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 126
LDI r2, 82
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
