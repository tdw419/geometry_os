; DESCRIPTION: Places a orange 90x107 rectangle at position (213, 90).
; PLAN: r0=213(x), r1=90(y), r2=90(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 90
LDI r2, 90
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
