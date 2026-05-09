; DESCRIPTION: Renders a yellow box of size 61x71 starting at (59, 133).
; PLAN: r0=59(x), r1=133(y), r2=61(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 133
LDI r2, 61
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
