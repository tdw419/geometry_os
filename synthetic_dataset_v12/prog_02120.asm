; DESCRIPTION: Places a black 91x31 rectangle at position (112, 135).
; PLAN: r0=112(x), r1=135(y), r2=91(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 135
LDI r2, 91
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
