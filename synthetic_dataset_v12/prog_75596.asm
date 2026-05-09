; DESCRIPTION: Renders a yellow box of size 38x20 starting at (288, 134).
; PLAN: r0=288(x), r1=134(y), r2=38(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 134
LDI r2, 38
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
