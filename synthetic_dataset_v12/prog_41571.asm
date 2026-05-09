; DESCRIPTION: Places a cyan 22x61 rectangle at position (364, 7).
; PLAN: r0=364(x), r1=7(y), r2=22(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 7
LDI r2, 22
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
