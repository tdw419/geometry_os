; DESCRIPTION: Places a cyan 23x91 rectangle at position (62, 75).
; PLAN: r0=62(x), r1=75(y), r2=23(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 75
LDI r2, 23
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
