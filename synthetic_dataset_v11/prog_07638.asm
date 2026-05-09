; DESCRIPTION: Places a red 64x11 rectangle at position (39, 140).
; PLAN: r0=39(x), r1=140(y), r2=64(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 140
LDI r2, 64
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
