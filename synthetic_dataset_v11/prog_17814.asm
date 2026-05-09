; DESCRIPTION: Places a blue 76x26 rectangle at position (115, 213).
; PLAN: r0=115(x), r1=213(y), r2=76(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 213
LDI r2, 76
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
