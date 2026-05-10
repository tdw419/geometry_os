; DESCRIPTION: Places a black 46x20 rectangle at position (212, 29).
; PLAN: r0=212(x), r1=29(y), r2=46(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 29
LDI r2, 46
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
