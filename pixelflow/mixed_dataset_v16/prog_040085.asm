; DESCRIPTION: Places a yellow 98x78 rectangle at position (298, 100).
; PLAN: r0=298(x), r1=100(y), r2=98(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 100
LDI r2, 98
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
