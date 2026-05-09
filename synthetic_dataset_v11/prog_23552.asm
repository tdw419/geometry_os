; DESCRIPTION: Places a white 15x34 rectangle at position (117, 50).
; PLAN: r0=117(x), r1=50(y), r2=15(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 50
LDI r2, 15
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
