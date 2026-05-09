; DESCRIPTION: Places a orange 93x56 rectangle at position (47, 171).
; PLAN: r0=47(x), r1=171(y), r2=93(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 171
LDI r2, 93
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
