; DESCRIPTION: Renders a red box of size 45x93 starting at (157, 150).
; PLAN: r0=157(x), r1=150(y), r2=45(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 150
LDI r2, 45
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
