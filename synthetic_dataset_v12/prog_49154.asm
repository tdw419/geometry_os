; DESCRIPTION: Places a cyan 16x35 rectangle at position (449, 4).
; PLAN: r0=449(x), r1=4(y), r2=16(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 4
LDI r2, 16
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
