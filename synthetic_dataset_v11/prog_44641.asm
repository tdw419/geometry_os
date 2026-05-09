; DESCRIPTION: Places a cyan 32x48 rectangle at position (39, 39).
; PLAN: r0=39(x), r1=39(y), r2=32(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 39
LDI r2, 32
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
