; DESCRIPTION: Renders a red box of size 69x86 starting at (442, 29).
; PLAN: r0=442(x), r1=29(y), r2=69(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 29
LDI r2, 69
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
