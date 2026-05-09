; DESCRIPTION: Renders a white box of size 73x86 starting at (101, 61).
; PLAN: r0=101(x), r1=61(y), r2=73(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 61
LDI r2, 73
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
