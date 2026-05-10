; DESCRIPTION: Places a orange 44x78 box at position (174, 113).
; PLAN: r0=174(x), r1=113(y), r2=44(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 113
LDI r2, 44
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
