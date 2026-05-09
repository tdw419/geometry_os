; DESCRIPTION: Places a black 87x25 rectangle at position (412, 173).
; PLAN: r0=412(x), r1=173(y), r2=87(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 173
LDI r2, 87
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
