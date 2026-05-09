; DESCRIPTION: Places a cyan 11x108 rectangle at position (27, 17).
; PLAN: r0=27(x), r1=17(y), r2=11(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 17
LDI r2, 11
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
