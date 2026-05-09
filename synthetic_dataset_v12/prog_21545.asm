; DESCRIPTION: Places a black 33x82 rectangle at position (174, 22).
; PLAN: r0=174(x), r1=22(y), r2=33(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 22
LDI r2, 33
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
