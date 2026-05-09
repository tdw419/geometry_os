; DESCRIPTION: Places a black 101x65 rectangle at position (228, 44).
; PLAN: r0=228(x), r1=44(y), r2=101(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 44
LDI r2, 101
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
