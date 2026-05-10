; DESCRIPTION: Places a red 14x20 rectangle at position (67, 86).
; PLAN: r0=67(x), r1=86(y), r2=14(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 86
LDI r2, 14
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
