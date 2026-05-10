; DESCRIPTION: Places a red 99x108 rectangle at position (407, 37).
; PLAN: r0=407(x), r1=37(y), r2=99(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 37
LDI r2, 99
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
