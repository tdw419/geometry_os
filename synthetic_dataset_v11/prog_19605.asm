; DESCRIPTION: Renders a red box of size 55x80 starting at (63, 64).
; PLAN: r0=63(x), r1=64(y), r2=55(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 64
LDI r2, 55
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
