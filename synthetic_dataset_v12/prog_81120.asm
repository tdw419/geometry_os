; DESCRIPTION: Places a cyan 50x12 rectangle at position (358, 39).
; PLAN: r0=358(x), r1=39(y), r2=50(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 39
LDI r2, 50
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
