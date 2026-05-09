; DESCRIPTION: Renders a red box of size 43x11 starting at (415, 199).
; PLAN: r0=415(x), r1=199(y), r2=43(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 199
LDI r2, 43
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
