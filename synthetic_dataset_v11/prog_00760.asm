; DESCRIPTION: Places a cyan 22x104 rectangle at position (42, 17).
; PLAN: r0=42(x), r1=17(y), r2=22(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 17
LDI r2, 22
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
