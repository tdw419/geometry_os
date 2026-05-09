; DESCRIPTION: Places a orange 37x71 rectangle at position (204, 108).
; PLAN: r0=204(x), r1=108(y), r2=37(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 108
LDI r2, 37
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
