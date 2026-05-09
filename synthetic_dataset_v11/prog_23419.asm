; DESCRIPTION: Places a white 50x69 rectangle at position (35, 30).
; PLAN: r0=35(x), r1=30(y), r2=50(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 30
LDI r2, 50
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
