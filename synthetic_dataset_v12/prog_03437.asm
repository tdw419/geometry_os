; DESCRIPTION: Places a orange 78x29 rectangle at position (392, 45).
; PLAN: r0=392(x), r1=45(y), r2=78(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 45
LDI r2, 78
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
