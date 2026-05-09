; DESCRIPTION: Renders a red box of size 64x69 starting at (308, 57).
; PLAN: r0=308(x), r1=57(y), r2=64(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 57
LDI r2, 64
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
