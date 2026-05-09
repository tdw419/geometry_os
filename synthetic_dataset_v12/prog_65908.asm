; DESCRIPTION: Places a cyan 54x56 rectangle at position (451, 134).
; PLAN: r0=451(x), r1=134(y), r2=54(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 134
LDI r2, 54
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
