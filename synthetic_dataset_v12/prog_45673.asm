; DESCRIPTION: Places a orange 102x107 rectangle at position (303, 0).
; PLAN: r0=303(x), r1=0(y), r2=102(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 0
LDI r2, 102
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
