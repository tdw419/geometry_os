; DESCRIPTION: Places a orange 18x65 rectangle at position (113, 46).
; PLAN: r0=113(x), r1=46(y), r2=18(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 46
LDI r2, 18
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
