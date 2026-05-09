; DESCRIPTION: Renders a yellow box of size 33x48 starting at (112, 48).
; PLAN: r0=112(x), r1=48(y), r2=33(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 48
LDI r2, 33
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
