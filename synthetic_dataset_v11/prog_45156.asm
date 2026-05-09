; DESCRIPTION: Places a white 108x87 rectangle at position (12, 65).
; PLAN: r0=12(x), r1=65(y), r2=108(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 65
LDI r2, 108
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
