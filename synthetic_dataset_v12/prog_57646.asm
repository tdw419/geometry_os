; DESCRIPTION: Places a red 119x19 rectangle at position (269, 6).
; PLAN: r0=269(x), r1=6(y), r2=119(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 6
LDI r2, 119
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
