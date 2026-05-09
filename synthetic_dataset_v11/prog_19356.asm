; DESCRIPTION: Places a cyan 35x54 rectangle at position (217, 64).
; PLAN: r0=217(x), r1=64(y), r2=35(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 64
LDI r2, 35
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
