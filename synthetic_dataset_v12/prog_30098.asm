; DESCRIPTION: Places a cyan 96x77 rectangle at position (175, 128).
; PLAN: r0=175(x), r1=128(y), r2=96(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 128
LDI r2, 96
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
