; DESCRIPTION: Places a cyan 115x54 rectangle at position (13, 148).
; PLAN: r0=13(x), r1=148(y), r2=115(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 148
LDI r2, 115
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
