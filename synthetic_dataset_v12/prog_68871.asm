; DESCRIPTION: Places a cyan 28x32 rectangle at position (389, 101).
; PLAN: r0=389(x), r1=101(y), r2=28(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 101
LDI r2, 28
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
