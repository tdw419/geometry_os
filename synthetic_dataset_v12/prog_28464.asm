; DESCRIPTION: Places a cyan 99x86 rectangle at position (258, 137).
; PLAN: r0=258(x), r1=137(y), r2=99(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 137
LDI r2, 99
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
