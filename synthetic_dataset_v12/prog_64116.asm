; DESCRIPTION: Renders a red box of size 47x28 starting at (148, 200).
; PLAN: r0=148(x), r1=200(y), r2=47(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 200
LDI r2, 47
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
