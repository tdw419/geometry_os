; DESCRIPTION: Renders a orange box of size 16x67 starting at (467, 93).
; PLAN: r0=467(x), r1=93(y), r2=16(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 93
LDI r2, 16
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
