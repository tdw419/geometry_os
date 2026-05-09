; DESCRIPTION: Places a cyan 92x94 rectangle at position (98, 159).
; PLAN: r0=98(x), r1=159(y), r2=92(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 159
LDI r2, 92
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
