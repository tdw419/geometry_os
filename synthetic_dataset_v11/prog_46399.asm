; DESCRIPTION: Places a cyan 84x97 rectangle at position (77, 95).
; PLAN: r0=77(x), r1=95(y), r2=84(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 95
LDI r2, 84
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
