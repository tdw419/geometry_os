; DESCRIPTION: Places a white 92x103 rectangle at position (166, 61).
; PLAN: r0=166(x), r1=61(y), r2=92(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 61
LDI r2, 92
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
