; DESCRIPTION: Places a cyan 38x63 rectangle at position (175, 145).
; PLAN: r0=175(x), r1=145(y), r2=38(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 145
LDI r2, 38
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
