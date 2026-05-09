; DESCRIPTION: Places a orange 90x91 rectangle at position (74, 45).
; PLAN: r0=74(x), r1=45(y), r2=90(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 45
LDI r2, 90
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
