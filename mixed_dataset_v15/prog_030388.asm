; DESCRIPTION: Places a orange 102x57 rectangle at position (106, 199).
; PLAN: r0=106(x), r1=199(y), r2=102(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 199
LDI r2, 102
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
