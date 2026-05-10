; DESCRIPTION: Places a orange 21x102 rectangle at position (0, 55).
; PLAN: r0=0(x), r1=55(y), r2=21(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 55
LDI r2, 21
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
