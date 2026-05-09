; DESCRIPTION: Renders a yellow box of size 48x73 starting at (70, 142).
; PLAN: r0=70(x), r1=142(y), r2=48(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 142
LDI r2, 48
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
