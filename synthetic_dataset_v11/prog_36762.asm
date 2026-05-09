; DESCRIPTION: Renders a red box of size 68x48 starting at (148, 157).
; PLAN: r0=148(x), r1=157(y), r2=68(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 157
LDI r2, 68
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
