; DESCRIPTION: Places a cyan 37x111 rectangle at position (47, 9).
; PLAN: r0=47(x), r1=9(y), r2=37(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 9
LDI r2, 37
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
