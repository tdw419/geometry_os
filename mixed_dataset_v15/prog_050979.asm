; DESCRIPTION: Renders a yellow box of size 78x86 starting at (402, 59).
; PLAN: r0=402(x), r1=59(y), r2=78(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 59
LDI r2, 78
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
