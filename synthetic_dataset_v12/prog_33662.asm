; DESCRIPTION: Places a cyan 99x94 rectangle at position (344, 135).
; PLAN: r0=344(x), r1=135(y), r2=99(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 135
LDI r2, 99
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
