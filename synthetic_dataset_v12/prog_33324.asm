; DESCRIPTION: Places a red 22x108 rectangle at position (45, 83).
; PLAN: r0=45(x), r1=83(y), r2=22(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 83
LDI r2, 22
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
