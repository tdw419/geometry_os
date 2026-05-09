; DESCRIPTION: Renders a yellow box of size 14x66 starting at (333, 96).
; PLAN: r0=333(x), r1=96(y), r2=14(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 96
LDI r2, 14
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
