; DESCRIPTION: Places a orange 61x47 rectangle at position (354, 183).
; PLAN: r0=354(x), r1=183(y), r2=61(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 183
LDI r2, 61
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
