; DESCRIPTION: Places a orange 64x57 box at position (371, 177).
; PLAN: r0=371(x), r1=177(y), r2=64(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 177
LDI r2, 64
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
