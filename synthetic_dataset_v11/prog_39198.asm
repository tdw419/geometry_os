; DESCRIPTION: Places a red 117x46 rectangle at position (122, 196).
; PLAN: r0=122(x), r1=196(y), r2=117(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 196
LDI r2, 117
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
