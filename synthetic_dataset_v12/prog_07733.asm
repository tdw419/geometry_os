; DESCRIPTION: Places a cyan 74x105 rectangle at position (255, 105).
; PLAN: r0=255(x), r1=105(y), r2=74(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 105
LDI r2, 74
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
