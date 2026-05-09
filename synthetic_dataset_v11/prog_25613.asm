; DESCRIPTION: Places a cyan 90x99 rectangle at position (47, 62).
; PLAN: r0=47(x), r1=62(y), r2=90(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 62
LDI r2, 90
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
