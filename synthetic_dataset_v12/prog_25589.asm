; DESCRIPTION: Places a orange 23x100 rectangle at position (286, 91).
; PLAN: r0=286(x), r1=91(y), r2=23(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 91
LDI r2, 23
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
