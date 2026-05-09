; DESCRIPTION: Places a white 50x60 rectangle at position (363, 69).
; PLAN: r0=363(x), r1=69(y), r2=50(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 69
LDI r2, 50
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
