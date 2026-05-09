; DESCRIPTION: Places a cyan 49x67 rectangle at position (16, 65).
; PLAN: r0=16(x), r1=65(y), r2=49(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 65
LDI r2, 49
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
