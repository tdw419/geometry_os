; DESCRIPTION: Places a cyan 21x30 rectangle at position (237, 94).
; PLAN: r0=237(x), r1=94(y), r2=21(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 94
LDI r2, 21
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
