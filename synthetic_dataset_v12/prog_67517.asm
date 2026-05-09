; DESCRIPTION: Places a red 107x29 rectangle at position (388, 131).
; PLAN: r0=388(x), r1=131(y), r2=107(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 131
LDI r2, 107
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
