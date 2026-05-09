; DESCRIPTION: Places a orange 35x47 rectangle at position (419, 171).
; PLAN: r0=419(x), r1=171(y), r2=35(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 171
LDI r2, 35
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
