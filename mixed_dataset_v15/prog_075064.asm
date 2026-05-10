; DESCRIPTION: Places a cyan 39x37 rectangle at position (103, 110).
; PLAN: r0=103(x), r1=110(y), r2=39(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 110
LDI r2, 39
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
