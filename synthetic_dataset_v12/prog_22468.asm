; DESCRIPTION: Places a orange 29x74 rectangle at position (40, 113).
; PLAN: r0=40(x), r1=113(y), r2=29(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 113
LDI r2, 29
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
