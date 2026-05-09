; DESCRIPTION: Places a cyan 83x35 rectangle at position (408, 157).
; PLAN: r0=408(x), r1=157(y), r2=83(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 157
LDI r2, 83
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
