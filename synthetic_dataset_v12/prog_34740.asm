; DESCRIPTION: Places a black 37x87 rectangle at position (443, 153).
; PLAN: r0=443(x), r1=153(y), r2=37(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 153
LDI r2, 37
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
