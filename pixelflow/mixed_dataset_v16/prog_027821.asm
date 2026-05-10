; DESCRIPTION: Renders a yellow box of size 33x92 starting at (142, 54).
; PLAN: r0=142(x), r1=54(y), r2=33(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 54
LDI r2, 33
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
