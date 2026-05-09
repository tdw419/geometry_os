; DESCRIPTION: Places a cyan 104x50 rectangle at position (115, 34).
; PLAN: r0=115(x), r1=34(y), r2=104(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 34
LDI r2, 104
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
