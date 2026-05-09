; DESCRIPTION: Places a cyan 58x36 rectangle at position (408, 148).
; PLAN: r0=408(x), r1=148(y), r2=58(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 148
LDI r2, 58
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
