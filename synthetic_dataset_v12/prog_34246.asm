; DESCRIPTION: Places a magenta 31x87 rectangle at position (394, 19).
; PLAN: r0=394(x), r1=19(y), r2=31(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 19
LDI r2, 31
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
