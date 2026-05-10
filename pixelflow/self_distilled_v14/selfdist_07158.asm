; DESCRIPTION: Places a orange 113x46 box at position (39, 52).
; PLAN: r0=39(x), r1=52(y), r2=113(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 52
LDI r2, 113
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
