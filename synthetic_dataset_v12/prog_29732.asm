; DESCRIPTION: Places a cyan 117x10 rectangle at position (255, 62).
; PLAN: r0=255(x), r1=62(y), r2=117(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 62
LDI r2, 117
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
