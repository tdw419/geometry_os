; DESCRIPTION: Places a green 55x67 rectangle at position (167, 34).
; PLAN: r0=167(x), r1=34(y), r2=55(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 34
LDI r2, 55
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
