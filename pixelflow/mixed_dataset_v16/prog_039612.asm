; DESCRIPTION: Renders a white box of size 118x32 starting at (30, 92).
; PLAN: r0=30(x), r1=92(y), r2=118(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 92
LDI r2, 118
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
