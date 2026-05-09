; DESCRIPTION: Renders a red box of size 64x93 starting at (211, 14).
; PLAN: r0=211(x), r1=14(y), r2=64(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 14
LDI r2, 64
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
