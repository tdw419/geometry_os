; DESCRIPTION: Places a yellow 81x15 box at position (275, 199).
; PLAN: r0=275(x), r1=199(y), r2=81(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 199
LDI r2, 81
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
