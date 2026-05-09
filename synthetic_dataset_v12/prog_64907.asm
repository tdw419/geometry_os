; DESCRIPTION: Places a cyan 94x35 rectangle at position (78, 172).
; PLAN: r0=78(x), r1=172(y), r2=94(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 172
LDI r2, 94
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
