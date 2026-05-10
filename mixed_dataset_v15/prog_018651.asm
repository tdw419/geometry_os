; DESCRIPTION: Places a cyan 101x23 rectangle at position (246, 98).
; PLAN: r0=246(x), r1=98(y), r2=101(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 98
LDI r2, 101
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
