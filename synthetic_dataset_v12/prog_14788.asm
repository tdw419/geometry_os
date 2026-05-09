; DESCRIPTION: Renders a red box of size 32x59 starting at (319, 0).
; PLAN: r0=319(x), r1=0(y), r2=32(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 0
LDI r2, 32
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
