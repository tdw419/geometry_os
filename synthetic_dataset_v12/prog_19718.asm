; DESCRIPTION: Places a black 25x16 rectangle at position (255, 52).
; PLAN: r0=255(x), r1=52(y), r2=25(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 52
LDI r2, 25
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
