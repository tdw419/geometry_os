; DESCRIPTION: Places a cyan 63x54 rectangle at position (153, 94).
; PLAN: r0=153(x), r1=94(y), r2=63(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 94
LDI r2, 63
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
