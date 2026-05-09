; DESCRIPTION: Places a blue 68x26 rectangle at position (405, 126).
; PLAN: r0=405(x), r1=126(y), r2=68(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 126
LDI r2, 68
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
