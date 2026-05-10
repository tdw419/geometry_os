; DESCRIPTION: Places a cyan 29x14 rectangle at position (2, 196).
; PLAN: r0=2(x), r1=196(y), r2=29(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 196
LDI r2, 29
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
