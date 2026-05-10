; DESCRIPTION: Places a cyan 49x106 rectangle at position (88, 50).
; PLAN: r0=88(x), r1=50(y), r2=49(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 50
LDI r2, 49
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
