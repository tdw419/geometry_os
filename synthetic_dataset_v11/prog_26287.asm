; DESCRIPTION: Renders a red box of size 48x55 starting at (107, 30).
; PLAN: r0=107(x), r1=30(y), r2=48(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 30
LDI r2, 48
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
