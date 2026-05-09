; DESCRIPTION: Places a yellow 86x113 rectangle at position (275, 43).
; PLAN: r0=275(x), r1=43(y), r2=86(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 43
LDI r2, 86
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
