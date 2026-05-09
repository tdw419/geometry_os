; DESCRIPTION: Places a yellow 107x42 rectangle at position (157, 104).
; PLAN: r0=157(x), r1=104(y), r2=107(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 104
LDI r2, 107
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
