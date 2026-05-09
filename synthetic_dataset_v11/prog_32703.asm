; DESCRIPTION: Places a cyan 104x95 rectangle at position (136, 12).
; PLAN: r0=136(x), r1=12(y), r2=104(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 12
LDI r2, 104
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
