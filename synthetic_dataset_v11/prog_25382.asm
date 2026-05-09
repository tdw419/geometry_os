; DESCRIPTION: Places a cyan 38x110 rectangle at position (69, 13).
; PLAN: r0=69(x), r1=13(y), r2=38(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 13
LDI r2, 38
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
