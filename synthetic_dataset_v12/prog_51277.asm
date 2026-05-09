; DESCRIPTION: Places a orange 44x24 rectangle at position (131, 29).
; PLAN: r0=131(x), r1=29(y), r2=44(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 29
LDI r2, 44
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
