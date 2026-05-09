; DESCRIPTION: Places a cyan 49x50 rectangle at position (183, 149).
; PLAN: r0=183(x), r1=149(y), r2=49(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 149
LDI r2, 49
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
