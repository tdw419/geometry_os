; DESCRIPTION: Places a cyan 80x19 rectangle at position (384, 64).
; PLAN: r0=384(x), r1=64(y), r2=80(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 64
LDI r2, 80
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
