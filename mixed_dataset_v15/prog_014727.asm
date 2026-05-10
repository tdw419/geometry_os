; DESCRIPTION: Places a green 96x32 rectangle at position (3, 71).
; PLAN: r0=3(x), r1=71(y), r2=96(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 71
LDI r2, 96
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
