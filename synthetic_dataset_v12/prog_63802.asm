; DESCRIPTION: Places a red 101x46 rectangle at position (131, 188).
; PLAN: r0=131(x), r1=188(y), r2=101(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 188
LDI r2, 101
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
