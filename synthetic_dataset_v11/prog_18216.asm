; DESCRIPTION: Places a orange 117x107 rectangle at position (46, 47).
; PLAN: r0=46(x), r1=47(y), r2=117(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 47
LDI r2, 117
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
