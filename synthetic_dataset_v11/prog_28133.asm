; DESCRIPTION: Places a white 34x116 rectangle at position (11, 2).
; PLAN: r0=11(x), r1=2(y), r2=34(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 2
LDI r2, 34
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
