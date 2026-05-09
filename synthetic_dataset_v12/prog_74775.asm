; DESCRIPTION: Places a cyan 14x106 rectangle at position (361, 70).
; PLAN: r0=361(x), r1=70(y), r2=14(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 70
LDI r2, 14
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
