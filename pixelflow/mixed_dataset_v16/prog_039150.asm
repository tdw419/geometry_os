; DESCRIPTION: Places a white 29x105 box at position (234, 27).
; PLAN: r0=234(x), r1=27(y), r2=29(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 27
LDI r2, 29
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
