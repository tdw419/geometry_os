; DESCRIPTION: Places a orange 120x37 rectangle at position (166, 148).
; PLAN: r0=166(x), r1=148(y), r2=120(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 148
LDI r2, 120
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
