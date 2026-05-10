; DESCRIPTION: Places a cyan 119x84 rectangle at position (187, 24).
; PLAN: r0=187(x), r1=24(y), r2=119(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 24
LDI r2, 119
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
