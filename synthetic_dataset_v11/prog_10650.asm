; DESCRIPTION: Places a white 25x30 rectangle at position (67, 44).
; PLAN: r0=67(x), r1=44(y), r2=25(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 44
LDI r2, 25
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
