; DESCRIPTION: Places a red 35x26 rectangle at position (272, 55).
; PLAN: r0=272(x), r1=55(y), r2=35(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 55
LDI r2, 35
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
