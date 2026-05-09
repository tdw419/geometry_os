; DESCRIPTION: Places a blue 50x87 rectangle at position (458, 102).
; PLAN: r0=458(x), r1=102(y), r2=50(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 102
LDI r2, 50
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
