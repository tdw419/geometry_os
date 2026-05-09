; DESCRIPTION: Renders a green box of size 61x59 starting at (407, 131).
; PLAN: r0=407(x), r1=131(y), r2=61(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 131
LDI r2, 61
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
