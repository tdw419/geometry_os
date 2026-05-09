; DESCRIPTION: Places a orange 90x98 rectangle at position (46, 17).
; PLAN: r0=46(x), r1=17(y), r2=90(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 17
LDI r2, 90
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
