; DESCRIPTION: Renders a white box of size 63x59 starting at (92, 162).
; PLAN: r0=92(x), r1=162(y), r2=63(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 162
LDI r2, 63
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
