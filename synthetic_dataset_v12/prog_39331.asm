; DESCRIPTION: Places a yellow 62x60 rectangle at position (378, 104).
; PLAN: r0=378(x), r1=104(y), r2=62(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 104
LDI r2, 62
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
