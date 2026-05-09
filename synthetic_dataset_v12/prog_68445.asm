; DESCRIPTION: Places a red 110x69 rectangle at position (351, 46).
; PLAN: r0=351(x), r1=46(y), r2=110(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 46
LDI r2, 110
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
