; DESCRIPTION: Places a cyan 119x37 rectangle at position (8, 171).
; PLAN: r0=8(x), r1=171(y), r2=119(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 171
LDI r2, 119
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
