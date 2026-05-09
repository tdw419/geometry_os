; DESCRIPTION: Places a black 76x46 rectangle at position (69, 186).
; PLAN: r0=69(x), r1=186(y), r2=76(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 186
LDI r2, 76
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
