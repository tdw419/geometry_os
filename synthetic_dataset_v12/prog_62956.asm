; DESCRIPTION: Places a green 78x62 rectangle at position (94, 27).
; PLAN: r0=94(x), r1=27(y), r2=78(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 27
LDI r2, 78
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
