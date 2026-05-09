; DESCRIPTION: Renders a red box of size 16x18 starting at (233, 27).
; PLAN: r0=233(x), r1=27(y), r2=16(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 27
LDI r2, 16
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
