; DESCRIPTION: Places a cyan 100x78 rectangle at position (187, 144).
; PLAN: r0=187(x), r1=144(y), r2=100(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 144
LDI r2, 100
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
