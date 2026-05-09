; DESCRIPTION: Renders a red box of size 56x32 starting at (57, 81).
; PLAN: r0=57(x), r1=81(y), r2=56(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 81
LDI r2, 56
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
