; DESCRIPTION: Places a cyan 84x30 rectangle at position (68, 13).
; PLAN: r0=68(x), r1=13(y), r2=84(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 13
LDI r2, 84
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
