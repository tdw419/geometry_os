; DESCRIPTION: Places a cyan 83x16 rectangle at position (18, 75).
; PLAN: r0=18(x), r1=75(y), r2=83(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 75
LDI r2, 83
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
