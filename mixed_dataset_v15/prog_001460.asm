; DESCRIPTION: Renders a red box of size 63x112 starting at (176, 95).
; PLAN: r0=176(x), r1=95(y), r2=63(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 95
LDI r2, 63
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
