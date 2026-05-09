; DESCRIPTION: Places a cyan 22x105 rectangle at position (67, 47).
; PLAN: r0=67(x), r1=47(y), r2=22(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 47
LDI r2, 22
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
