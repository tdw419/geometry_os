; DESCRIPTION: Places a yellow 44x37 rectangle at position (439, 102).
; PLAN: r0=439(x), r1=102(y), r2=44(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 102
LDI r2, 44
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
