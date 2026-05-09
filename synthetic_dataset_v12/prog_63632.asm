; DESCRIPTION: Renders a yellow box of size 54x57 starting at (5, 29).
; PLAN: r0=5(x), r1=29(y), r2=54(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 29
LDI r2, 54
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
