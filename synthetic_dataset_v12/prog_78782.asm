; DESCRIPTION: Places a cyan 73x83 rectangle at position (144, 75).
; PLAN: r0=144(x), r1=75(y), r2=73(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 75
LDI r2, 73
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
