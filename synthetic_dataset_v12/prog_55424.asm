; DESCRIPTION: Renders a red box of size 43x63 starting at (368, 93).
; PLAN: r0=368(x), r1=93(y), r2=43(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 93
LDI r2, 43
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
