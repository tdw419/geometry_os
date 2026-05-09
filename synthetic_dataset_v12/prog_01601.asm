; DESCRIPTION: Places a green 78x36 rectangle at position (256, 195).
; PLAN: r0=256(x), r1=195(y), r2=78(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 195
LDI r2, 78
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
