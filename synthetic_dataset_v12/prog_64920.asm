; DESCRIPTION: Places a red 67x17 rectangle at position (360, 226).
; PLAN: r0=360(x), r1=226(y), r2=67(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 226
LDI r2, 67
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
