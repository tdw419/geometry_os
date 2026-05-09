; DESCRIPTION: Renders a red box of size 68x32 starting at (189, 134).
; PLAN: r0=189(x), r1=134(y), r2=68(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 134
LDI r2, 68
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
