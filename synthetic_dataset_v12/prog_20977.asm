; DESCRIPTION: Renders a yellow box of size 92x113 starting at (90, 59).
; PLAN: r0=90(x), r1=59(y), r2=92(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 59
LDI r2, 92
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
