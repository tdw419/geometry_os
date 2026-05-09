; DESCRIPTION: Places a green 86x107 rectangle at position (135, 44).
; PLAN: r0=135(x), r1=44(y), r2=86(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 44
LDI r2, 86
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
