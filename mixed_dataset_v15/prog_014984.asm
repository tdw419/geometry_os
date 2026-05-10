; DESCRIPTION: Places a cyan 49x74 rectangle at position (209, 68).
; PLAN: r0=209(x), r1=68(y), r2=49(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 68
LDI r2, 49
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
