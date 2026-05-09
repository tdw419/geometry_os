; DESCRIPTION: Places a orange 27x14 rectangle at position (337, 137).
; PLAN: r0=337(x), r1=137(y), r2=27(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 137
LDI r2, 27
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
