; DESCRIPTION: Places a red 13x85 rectangle at position (378, 16).
; PLAN: r0=378(x), r1=16(y), r2=13(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 16
LDI r2, 13
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
