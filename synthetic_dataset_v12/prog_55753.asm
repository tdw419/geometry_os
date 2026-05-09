; DESCRIPTION: Places a magenta 19x32 rectangle at position (347, 210).
; PLAN: r0=347(x), r1=210(y), r2=19(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 210
LDI r2, 19
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
