; DESCRIPTION: Places a cyan 25x47 rectangle at position (237, 78).
; PLAN: r0=237(x), r1=78(y), r2=25(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 78
LDI r2, 25
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
