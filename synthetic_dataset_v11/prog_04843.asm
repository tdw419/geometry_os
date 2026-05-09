; DESCRIPTION: Places a cyan 87x60 rectangle at position (137, 103).
; PLAN: r0=137(x), r1=103(y), r2=87(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 103
LDI r2, 87
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
