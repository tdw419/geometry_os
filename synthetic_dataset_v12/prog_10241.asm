; DESCRIPTION: Renders a yellow box of size 84x18 starting at (59, 190).
; PLAN: r0=59(x), r1=190(y), r2=84(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 190
LDI r2, 84
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
