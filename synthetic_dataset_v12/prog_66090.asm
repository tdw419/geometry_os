; DESCRIPTION: Renders a red box of size 35x115 starting at (300, 64).
; PLAN: r0=300(x), r1=64(y), r2=35(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 64
LDI r2, 35
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
