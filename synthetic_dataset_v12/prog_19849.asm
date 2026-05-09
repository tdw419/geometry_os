; DESCRIPTION: Places a cyan 53x94 rectangle at position (340, 55).
; PLAN: r0=340(x), r1=55(y), r2=53(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 55
LDI r2, 53
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
