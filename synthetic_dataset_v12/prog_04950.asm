; DESCRIPTION: Places a yellow 18x15 rectangle at position (435, 10).
; PLAN: r0=435(x), r1=10(y), r2=18(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 10
LDI r2, 18
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
