; DESCRIPTION: Places a yellow 46x76 rectangle at position (378, 98).
; PLAN: r0=378(x), r1=98(y), r2=46(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 98
LDI r2, 46
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
