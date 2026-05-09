; DESCRIPTION: Places a cyan 68x54 rectangle at position (8, 110).
; PLAN: r0=8(x), r1=110(y), r2=68(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 110
LDI r2, 68
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
