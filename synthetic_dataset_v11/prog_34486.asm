; DESCRIPTION: Places a cyan 69x70 rectangle at position (129, 35).
; PLAN: r0=129(x), r1=35(y), r2=69(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 35
LDI r2, 69
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
