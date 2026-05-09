; DESCRIPTION: Renders a yellow box of size 57x48 starting at (202, 88).
; PLAN: r0=202(x), r1=88(y), r2=57(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 88
LDI r2, 57
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
