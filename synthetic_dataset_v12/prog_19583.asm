; DESCRIPTION: Places a yellow 91x43 rectangle at position (29, 193).
; PLAN: r0=29(x), r1=193(y), r2=91(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 193
LDI r2, 91
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
