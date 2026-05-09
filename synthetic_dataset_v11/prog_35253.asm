; DESCRIPTION: Places a cyan 75x78 rectangle at position (102, 3).
; PLAN: r0=102(x), r1=3(y), r2=75(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 3
LDI r2, 75
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
