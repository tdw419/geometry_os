; DESCRIPTION: Places a white 106x85 rectangle at position (33, 116).
; PLAN: r0=33(x), r1=116(y), r2=106(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 116
LDI r2, 106
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
