; DESCRIPTION: Places a cyan 30x62 rectangle at position (20, 161).
; PLAN: r0=20(x), r1=161(y), r2=30(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 161
LDI r2, 30
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
