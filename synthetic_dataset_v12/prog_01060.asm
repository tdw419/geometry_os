; DESCRIPTION: Places a cyan 98x32 rectangle at position (96, 43).
; PLAN: r0=96(x), r1=43(y), r2=98(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 43
LDI r2, 98
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
