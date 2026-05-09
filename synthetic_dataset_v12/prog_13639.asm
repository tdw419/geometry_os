; DESCRIPTION: Renders a red box of size 16x111 starting at (143, 26).
; PLAN: r0=143(x), r1=26(y), r2=16(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 26
LDI r2, 16
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
