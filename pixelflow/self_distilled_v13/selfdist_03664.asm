; DESCRIPTION: Places a orange 44x76 box at position (268, 55).
; PLAN: r0=268(x), r1=55(y), r2=44(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 55
LDI r2, 44
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
