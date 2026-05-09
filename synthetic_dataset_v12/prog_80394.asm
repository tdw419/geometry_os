; DESCRIPTION: Places a white 67x89 rectangle at position (343, 154).
; PLAN: r0=343(x), r1=154(y), r2=67(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 154
LDI r2, 67
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
