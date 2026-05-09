; DESCRIPTION: Places a white 26x70 rectangle at position (54, 68).
; PLAN: r0=54(x), r1=68(y), r2=26(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 68
LDI r2, 26
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
