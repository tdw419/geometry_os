; DESCRIPTION: Places a red 91x56 rectangle at position (11, 152).
; PLAN: r0=11(x), r1=152(y), r2=91(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 152
LDI r2, 91
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
