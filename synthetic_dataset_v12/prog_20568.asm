; DESCRIPTION: Places a yellow 63x35 rectangle at position (298, 129).
; PLAN: r0=298(x), r1=129(y), r2=63(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 129
LDI r2, 63
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
