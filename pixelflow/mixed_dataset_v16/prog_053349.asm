; DESCRIPTION: Places a cyan 14x102 rectangle at position (141, 9).
; PLAN: r0=141(x), r1=9(y), r2=14(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 9
LDI r2, 14
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
