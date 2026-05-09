; DESCRIPTION: Places a blue 23x21 rectangle at position (231, 134).
; PLAN: r0=231(x), r1=134(y), r2=23(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 134
LDI r2, 23
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
