; DESCRIPTION: Renders a yellow box of size 29x120 starting at (135, 39).
; PLAN: r0=135(x), r1=39(y), r2=29(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 39
LDI r2, 29
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
