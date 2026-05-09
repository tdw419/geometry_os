; DESCRIPTION: Places a cyan 17x78 rectangle at position (387, 119).
; PLAN: r0=387(x), r1=119(y), r2=17(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 119
LDI r2, 17
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
