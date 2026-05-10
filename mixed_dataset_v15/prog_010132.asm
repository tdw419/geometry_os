; DESCRIPTION: Renders a red box of size 33x36 starting at (291, 142).
; PLAN: r0=291(x), r1=142(y), r2=33(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 142
LDI r2, 33
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
