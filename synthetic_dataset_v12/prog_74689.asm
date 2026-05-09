; DESCRIPTION: Places a black 50x116 rectangle at position (151, 46).
; PLAN: r0=151(x), r1=46(y), r2=50(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 46
LDI r2, 50
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
