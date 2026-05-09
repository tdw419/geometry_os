; DESCRIPTION: Places a orange 48x18 rectangle at position (153, 90).
; PLAN: r0=153(x), r1=90(y), r2=48(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 90
LDI r2, 48
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
