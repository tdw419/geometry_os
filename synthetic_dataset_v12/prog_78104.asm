; DESCRIPTION: Places a magenta 58x119 rectangle at position (298, 29).
; PLAN: r0=298(x), r1=29(y), r2=58(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 29
LDI r2, 58
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
