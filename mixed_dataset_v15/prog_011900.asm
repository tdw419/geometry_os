; DESCRIPTION: Places a orange 91x28 rectangle at position (363, 2).
; PLAN: r0=363(x), r1=2(y), r2=91(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 2
LDI r2, 91
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
