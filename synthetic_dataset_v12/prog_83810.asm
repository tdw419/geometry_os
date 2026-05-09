; DESCRIPTION: Renders a yellow box of size 77x86 starting at (4, 142).
; PLAN: r0=4(x), r1=142(y), r2=77(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 142
LDI r2, 77
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
