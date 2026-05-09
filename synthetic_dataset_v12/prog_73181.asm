; DESCRIPTION: Renders a yellow box of size 59x54 starting at (373, 182).
; PLAN: r0=373(x), r1=182(y), r2=59(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 182
LDI r2, 59
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
