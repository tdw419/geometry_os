; DESCRIPTION: Renders a white box of size 92x61 starting at (210, 58).
; PLAN: r0=210(x), r1=58(y), r2=92(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 58
LDI r2, 92
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
