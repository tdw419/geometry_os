; DESCRIPTION: Places a white 88x10 rectangle at position (278, 71).
; PLAN: r0=278(x), r1=71(y), r2=88(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 71
LDI r2, 88
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
