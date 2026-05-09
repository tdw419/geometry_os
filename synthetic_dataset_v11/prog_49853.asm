; DESCRIPTION: Places a green 105x97 rectangle at position (40, 117).
; PLAN: r0=40(x), r1=117(y), r2=105(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 117
LDI r2, 105
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
