; DESCRIPTION: Places a orange 26x111 box at position (279, 174).
; PLAN: r0=279(x), r1=174(y), r2=26(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 174
LDI r2, 26
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
