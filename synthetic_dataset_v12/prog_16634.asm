; DESCRIPTION: Places a black 102x90 rectangle at position (144, 28).
; PLAN: r0=144(x), r1=28(y), r2=102(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 28
LDI r2, 102
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
