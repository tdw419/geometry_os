; DESCRIPTION: Places a cyan 10x62 rectangle at position (308, 166).
; PLAN: r0=308(x), r1=166(y), r2=10(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 166
LDI r2, 10
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
