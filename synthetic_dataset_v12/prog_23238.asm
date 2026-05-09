; DESCRIPTION: Places a cyan 85x72 rectangle at position (72, 99).
; PLAN: r0=72(x), r1=99(y), r2=85(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 99
LDI r2, 85
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
