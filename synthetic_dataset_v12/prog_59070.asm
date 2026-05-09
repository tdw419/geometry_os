; DESCRIPTION: Places a cyan 58x50 rectangle at position (37, 181).
; PLAN: r0=37(x), r1=181(y), r2=58(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 181
LDI r2, 58
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
