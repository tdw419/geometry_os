; DESCRIPTION: Places a cyan 70x70 rectangle at position (326, 110).
; PLAN: r0=326(x), r1=110(y), r2=70(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 110
LDI r2, 70
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
