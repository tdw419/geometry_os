; DESCRIPTION: Places a cyan 64x14 rectangle at position (275, 165).
; PLAN: r0=275(x), r1=165(y), r2=64(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 165
LDI r2, 64
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
