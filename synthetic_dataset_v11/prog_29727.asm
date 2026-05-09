; DESCRIPTION: Places a cyan 80x56 rectangle at position (130, 87).
; PLAN: r0=130(x), r1=87(y), r2=80(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 87
LDI r2, 80
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
