; DESCRIPTION: Places a cyan 104x47 rectangle at position (119, 93).
; PLAN: r0=119(x), r1=93(y), r2=104(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 93
LDI r2, 104
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
