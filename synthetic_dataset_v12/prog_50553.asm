; DESCRIPTION: Places a cyan 21x115 rectangle at position (360, 3).
; PLAN: r0=360(x), r1=3(y), r2=21(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 3
LDI r2, 21
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
