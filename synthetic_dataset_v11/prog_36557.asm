; DESCRIPTION: Places a yellow 105x47 rectangle at position (49, 108).
; PLAN: r0=49(x), r1=108(y), r2=105(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 108
LDI r2, 105
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
