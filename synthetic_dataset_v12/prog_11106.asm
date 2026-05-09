; DESCRIPTION: Renders a red box of size 78x40 starting at (267, 128).
; PLAN: r0=267(x), r1=128(y), r2=78(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 128
LDI r2, 78
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
