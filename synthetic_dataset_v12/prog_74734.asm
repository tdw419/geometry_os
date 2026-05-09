; DESCRIPTION: Places a cyan 93x50 rectangle at position (344, 86).
; PLAN: r0=344(x), r1=86(y), r2=93(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 86
LDI r2, 93
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
