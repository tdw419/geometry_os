; DESCRIPTION: Places a orange 12x67 rectangle at position (255, 93).
; PLAN: r0=255(x), r1=93(y), r2=12(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 93
LDI r2, 12
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
