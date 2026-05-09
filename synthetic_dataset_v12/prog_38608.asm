; DESCRIPTION: Places a orange 89x17 rectangle at position (152, 221).
; PLAN: r0=152(x), r1=221(y), r2=89(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 221
LDI r2, 89
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
