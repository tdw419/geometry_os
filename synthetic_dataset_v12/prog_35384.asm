; DESCRIPTION: Places a cyan 84x107 rectangle at position (57, 62).
; PLAN: r0=57(x), r1=62(y), r2=84(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 62
LDI r2, 84
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
