; DESCRIPTION: Places a white 58x92 rectangle at position (378, 93).
; PLAN: r0=378(x), r1=93(y), r2=58(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 93
LDI r2, 58
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
