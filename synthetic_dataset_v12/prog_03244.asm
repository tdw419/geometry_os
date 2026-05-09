; DESCRIPTION: Places a orange 32x112 rectangle at position (455, 46).
; PLAN: r0=455(x), r1=46(y), r2=32(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 46
LDI r2, 32
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
