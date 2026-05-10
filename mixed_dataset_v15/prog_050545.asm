; DESCRIPTION: Places a black 91x43 rectangle at position (182, 205).
; PLAN: r0=182(x), r1=205(y), r2=91(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 205
LDI r2, 91
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
