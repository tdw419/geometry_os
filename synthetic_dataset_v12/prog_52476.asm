; DESCRIPTION: Renders a white box of size 92x36 starting at (214, 7).
; PLAN: r0=214(x), r1=7(y), r2=92(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 7
LDI r2, 92
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
