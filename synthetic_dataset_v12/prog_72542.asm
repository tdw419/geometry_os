; DESCRIPTION: Renders a blue box of size 95x41 starting at (239, 83).
; PLAN: r0=239(x), r1=83(y), r2=95(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 83
LDI r2, 95
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
