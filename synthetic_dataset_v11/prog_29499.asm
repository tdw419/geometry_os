; DESCRIPTION: Places a green 107x102 rectangle at position (83, 31).
; PLAN: r0=83(x), r1=31(y), r2=107(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 31
LDI r2, 107
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
