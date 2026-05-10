; DESCRIPTION: Places a orange 70x91 box at position (384, 58).
; PLAN: r0=384(x), r1=58(y), r2=70(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 58
LDI r2, 70
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
