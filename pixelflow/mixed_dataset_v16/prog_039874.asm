; DESCRIPTION: Places a cyan 84x109 rectangle at position (128, 34).
; PLAN: r0=128(x), r1=34(y), r2=84(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 34
LDI r2, 84
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
