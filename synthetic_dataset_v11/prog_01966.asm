; DESCRIPTION: Places a cyan 20x94 rectangle at position (225, 108).
; PLAN: r0=225(x), r1=108(y), r2=20(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 108
LDI r2, 20
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
