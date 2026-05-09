; DESCRIPTION: Places a orange 102x87 rectangle at position (269, 62).
; PLAN: r0=269(x), r1=62(y), r2=102(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 62
LDI r2, 102
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
