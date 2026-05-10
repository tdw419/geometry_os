; DESCRIPTION: Renders a red box of size 60x27 starting at (135, 116).
; PLAN: r0=135(x), r1=116(y), r2=60(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 116
LDI r2, 60
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
