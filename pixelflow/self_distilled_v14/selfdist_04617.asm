; DESCRIPTION: Places a cyan 94x36 box at position (71, 133).
; PLAN: r0=71(x), r1=133(y), r2=94(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 133
LDI r2, 94
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
