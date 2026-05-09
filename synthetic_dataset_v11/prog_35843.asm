; DESCRIPTION: Places a red 92x110 rectangle at position (44, 48).
; PLAN: r0=44(x), r1=48(y), r2=92(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 48
LDI r2, 92
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
