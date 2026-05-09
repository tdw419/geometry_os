; DESCRIPTION: Places a orange 58x98 rectangle at position (167, 86).
; PLAN: r0=167(x), r1=86(y), r2=58(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 86
LDI r2, 58
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
