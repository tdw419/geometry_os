; DESCRIPTION: Places a cyan 34x69 rectangle at position (440, 175).
; PLAN: r0=440(x), r1=175(y), r2=34(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 175
LDI r2, 34
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
