; DESCRIPTION: Renders a black box of size 61x75 starting at (184, 83).
; PLAN: r0=184(x), r1=83(y), r2=61(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 83
LDI r2, 61
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
