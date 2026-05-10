; DESCRIPTION: Places a purple 18x59 rectangle at position (275, 135).
; PLAN: r0=275(x), r1=135(y), r2=18(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 135
LDI r2, 18
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
