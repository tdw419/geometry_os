; DESCRIPTION: Places a red 87x102 rectangle at position (45, 98).
; PLAN: r0=45(x), r1=98(y), r2=87(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 98
LDI r2, 87
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
