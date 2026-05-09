; DESCRIPTION: Places a red 36x67 rectangle at position (359, 96).
; PLAN: r0=359(x), r1=96(y), r2=36(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 96
LDI r2, 36
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
