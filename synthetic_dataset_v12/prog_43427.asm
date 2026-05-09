; DESCRIPTION: Places a green 78x65 rectangle at position (207, 30).
; PLAN: r0=207(x), r1=30(y), r2=78(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 30
LDI r2, 78
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
