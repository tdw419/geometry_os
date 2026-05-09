; DESCRIPTION: Renders a yellow box of size 27x112 starting at (70, 73).
; PLAN: r0=70(x), r1=73(y), r2=27(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 73
LDI r2, 27
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
