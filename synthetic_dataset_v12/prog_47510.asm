; DESCRIPTION: Places a green 62x97 rectangle at position (276, 50).
; PLAN: r0=276(x), r1=50(y), r2=62(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 50
LDI r2, 62
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
