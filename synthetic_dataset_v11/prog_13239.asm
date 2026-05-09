; DESCRIPTION: Renders a red box of size 63x59 starting at (64, 183).
; PLAN: r0=64(x), r1=183(y), r2=63(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 183
LDI r2, 63
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
