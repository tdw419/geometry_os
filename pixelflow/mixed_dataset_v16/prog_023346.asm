; DESCRIPTION: Places a cyan 21x14 rectangle at position (196, 137).
; PLAN: r0=196(x), r1=137(y), r2=21(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 137
LDI r2, 21
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
