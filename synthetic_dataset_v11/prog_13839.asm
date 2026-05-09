; DESCRIPTION: Places a white 103x62 rectangle at position (60, 10).
; PLAN: r0=60(x), r1=10(y), r2=103(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 10
LDI r2, 103
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
