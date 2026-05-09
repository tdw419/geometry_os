; DESCRIPTION: Places a black 104x28 rectangle at position (98, 206).
; PLAN: r0=98(x), r1=206(y), r2=104(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 206
LDI r2, 104
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
