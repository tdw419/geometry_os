; DESCRIPTION: Renders a red box of size 52x86 starting at (72, 29).
; PLAN: r0=72(x), r1=29(y), r2=52(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 29
LDI r2, 52
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
