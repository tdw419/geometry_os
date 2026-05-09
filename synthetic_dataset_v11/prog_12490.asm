; DESCRIPTION: Places a cyan 64x12 rectangle at position (36, 125).
; PLAN: r0=36(x), r1=125(y), r2=64(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 125
LDI r2, 64
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
