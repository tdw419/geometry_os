; DESCRIPTION: Places a green 94x18 rectangle at position (324, 135).
; PLAN: r0=324(x), r1=135(y), r2=94(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 135
LDI r2, 94
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
