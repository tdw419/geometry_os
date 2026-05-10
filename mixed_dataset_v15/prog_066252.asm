; DESCRIPTION: Renders a red box of size 77x98 starting at (176, 144).
; PLAN: r0=176(x), r1=144(y), r2=77(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 144
LDI r2, 77
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
