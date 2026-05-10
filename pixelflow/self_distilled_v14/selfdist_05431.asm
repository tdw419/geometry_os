; DESCRIPTION: Places a white 69x116 box at position (233, 44).
; PLAN: r0=233(x), r1=44(y), r2=69(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 44
LDI r2, 69
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
