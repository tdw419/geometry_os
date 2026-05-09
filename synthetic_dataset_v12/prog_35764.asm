; DESCRIPTION: Places a cyan 82x103 rectangle at position (140, 104).
; PLAN: r0=140(x), r1=104(y), r2=82(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 104
LDI r2, 82
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
