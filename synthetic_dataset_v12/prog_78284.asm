; DESCRIPTION: Renders a white box of size 78x120 starting at (214, 23).
; PLAN: r0=214(x), r1=23(y), r2=78(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 23
LDI r2, 78
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
