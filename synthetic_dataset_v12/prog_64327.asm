; DESCRIPTION: Places a orange 90x83 rectangle at position (322, 61).
; PLAN: r0=322(x), r1=61(y), r2=90(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 61
LDI r2, 90
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
