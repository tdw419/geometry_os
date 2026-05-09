; DESCRIPTION: Places a cyan 17x107 rectangle at position (283, 38).
; PLAN: r0=283(x), r1=38(y), r2=17(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 38
LDI r2, 17
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
