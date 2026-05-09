; DESCRIPTION: Places a red 113x99 rectangle at position (313, 67).
; PLAN: r0=313(x), r1=67(y), r2=113(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 67
LDI r2, 113
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
