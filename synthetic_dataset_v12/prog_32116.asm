; DESCRIPTION: Places a yellow 22x55 rectangle at position (0, 172).
; PLAN: r0=0(x), r1=172(y), r2=22(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 172
LDI r2, 22
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
