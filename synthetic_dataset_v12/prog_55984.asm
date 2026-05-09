; DESCRIPTION: Places a green 94x97 rectangle at position (276, 86).
; PLAN: r0=276(x), r1=86(y), r2=94(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 86
LDI r2, 94
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
