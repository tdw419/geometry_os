; DESCRIPTION: Places a cyan 117x115 rectangle at position (86, 24).
; PLAN: r0=86(x), r1=24(y), r2=117(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 24
LDI r2, 117
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
