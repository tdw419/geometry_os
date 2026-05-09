; DESCRIPTION: Places a orange 61x45 rectangle at position (357, 130).
; PLAN: r0=357(x), r1=130(y), r2=61(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 130
LDI r2, 61
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
