; DESCRIPTION: Places a cyan 74x39 rectangle at position (372, 128).
; PLAN: r0=372(x), r1=128(y), r2=74(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 128
LDI r2, 74
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
