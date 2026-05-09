; DESCRIPTION: Places a black 46x60 rectangle at position (395, 166).
; PLAN: r0=395(x), r1=166(y), r2=46(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 166
LDI r2, 46
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
