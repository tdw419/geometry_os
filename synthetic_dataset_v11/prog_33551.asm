; DESCRIPTION: Places a cyan 107x17 rectangle at position (40, 56).
; PLAN: r0=40(x), r1=56(y), r2=107(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 56
LDI r2, 107
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
