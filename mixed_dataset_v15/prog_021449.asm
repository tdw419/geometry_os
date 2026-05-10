; DESCRIPTION: Renders a yellow box of size 28x52 starting at (196, 178).
; PLAN: r0=196(x), r1=178(y), r2=28(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 178
LDI r2, 28
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
