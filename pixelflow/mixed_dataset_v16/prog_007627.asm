; DESCRIPTION: Places a white 30x71 rectangle at position (88, 80).
; PLAN: r0=88(x), r1=80(y), r2=30(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 80
LDI r2, 30
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
