; DESCRIPTION: Places a black 56x24 rectangle at position (280, 181).
; PLAN: r0=280(x), r1=181(y), r2=56(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 181
LDI r2, 56
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
