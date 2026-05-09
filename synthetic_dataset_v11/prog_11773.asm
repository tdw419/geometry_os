; DESCRIPTION: Places a orange 12x44 rectangle at position (45, 112).
; PLAN: r0=45(x), r1=112(y), r2=12(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 112
LDI r2, 12
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
