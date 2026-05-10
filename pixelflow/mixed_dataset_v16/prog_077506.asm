; DESCRIPTION: Places a orange 96x48 rectangle at position (261, 64).
; PLAN: r0=261(x), r1=64(y), r2=96(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 64
LDI r2, 96
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
