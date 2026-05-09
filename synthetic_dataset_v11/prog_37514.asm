; DESCRIPTION: Places a white 68x69 rectangle at position (41, 154).
; PLAN: r0=41(x), r1=154(y), r2=68(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 154
LDI r2, 68
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
