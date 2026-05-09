; DESCRIPTION: Places a green 97x68 rectangle at position (360, 21).
; PLAN: r0=360(x), r1=21(y), r2=97(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 21
LDI r2, 97
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
