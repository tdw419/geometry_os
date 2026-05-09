; DESCRIPTION: Places a white 69x96 rectangle at position (368, 120).
; PLAN: r0=368(x), r1=120(y), r2=69(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 120
LDI r2, 69
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
