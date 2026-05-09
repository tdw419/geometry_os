; DESCRIPTION: Places a red 83x39 rectangle at position (354, 104).
; PLAN: r0=354(x), r1=104(y), r2=83(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 104
LDI r2, 83
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
