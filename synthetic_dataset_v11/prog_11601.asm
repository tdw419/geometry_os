; DESCRIPTION: Renders a yellow box of size 88x48 starting at (71, 178).
; PLAN: r0=71(x), r1=178(y), r2=88(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 178
LDI r2, 88
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
