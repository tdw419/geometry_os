; DESCRIPTION: Places a cyan 110x69 rectangle at position (172, 167).
; PLAN: r0=172(x), r1=167(y), r2=110(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 167
LDI r2, 110
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
