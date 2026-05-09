; DESCRIPTION: Places a orange 33x46 rectangle at position (152, 128).
; PLAN: r0=152(x), r1=128(y), r2=33(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 128
LDI r2, 33
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
