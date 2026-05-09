; DESCRIPTION: Places a orange 46x110 rectangle at position (33, 108).
; PLAN: r0=33(x), r1=108(y), r2=46(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 108
LDI r2, 46
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
