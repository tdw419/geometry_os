; DESCRIPTION: Places a orange 92x46 box at position (227, 113).
; PLAN: r0=227(x), r1=113(y), r2=92(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 113
LDI r2, 92
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
