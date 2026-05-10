; DESCRIPTION: Places a cyan 119x86 box at position (283, 58).
; PLAN: r0=283(x), r1=58(y), r2=119(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 58
LDI r2, 119
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
