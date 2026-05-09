; DESCRIPTION: Places a cyan 63x108 rectangle at position (165, 105).
; PLAN: r0=165(x), r1=105(y), r2=63(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 105
LDI r2, 63
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
