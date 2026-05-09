; DESCRIPTION: Places a yellow 30x85 rectangle at position (298, 56).
; PLAN: r0=298(x), r1=56(y), r2=30(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 56
LDI r2, 30
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
