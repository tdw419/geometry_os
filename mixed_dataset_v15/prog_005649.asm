; DESCRIPTION: Places a green 82x19 rectangle at position (95, 104).
; PLAN: r0=95(x), r1=104(y), r2=82(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 104
LDI r2, 82
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
