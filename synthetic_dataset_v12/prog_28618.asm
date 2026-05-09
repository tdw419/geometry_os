; DESCRIPTION: Places a red 35x11 rectangle at position (418, 70).
; PLAN: r0=418(x), r1=70(y), r2=35(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 70
LDI r2, 35
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
