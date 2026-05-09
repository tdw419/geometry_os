; DESCRIPTION: Places a red 15x47 rectangle at position (207, 45).
; PLAN: r0=207(x), r1=45(y), r2=15(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 45
LDI r2, 15
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
