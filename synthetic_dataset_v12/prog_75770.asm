; DESCRIPTION: Renders a yellow box of size 59x52 starting at (446, 6).
; PLAN: r0=446(x), r1=6(y), r2=59(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 6
LDI r2, 59
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
