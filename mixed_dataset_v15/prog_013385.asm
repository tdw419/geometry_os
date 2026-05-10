; DESCRIPTION: Places a cyan 98x106 rectangle at position (381, 44).
; PLAN: r0=381(x), r1=44(y), r2=98(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 44
LDI r2, 98
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
