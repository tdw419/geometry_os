; DESCRIPTION: Renders a red box of size 92x59 starting at (367, 47).
; PLAN: r0=367(x), r1=47(y), r2=92(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 47
LDI r2, 92
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
