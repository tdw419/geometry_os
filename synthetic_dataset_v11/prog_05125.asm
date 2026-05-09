; DESCRIPTION: Places a magenta 99x41 rectangle at position (124, 65).
; PLAN: r0=124(x), r1=65(y), r2=99(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 65
LDI r2, 99
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
