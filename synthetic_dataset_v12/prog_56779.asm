; DESCRIPTION: Places a green 97x23 rectangle at position (107, 150).
; PLAN: r0=107(x), r1=150(y), r2=97(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 150
LDI r2, 97
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
