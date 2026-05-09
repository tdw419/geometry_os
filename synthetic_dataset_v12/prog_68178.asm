; DESCRIPTION: Renders a red box of size 90x28 starting at (347, 83).
; PLAN: r0=347(x), r1=83(y), r2=90(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 83
LDI r2, 90
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
