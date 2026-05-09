; DESCRIPTION: Places a cyan 17x17 rectangle at position (77, 225).
; PLAN: r0=77(x), r1=225(y), r2=17(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 225
LDI r2, 17
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
