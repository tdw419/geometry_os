; DESCRIPTION: Places a yellow 28x73 rectangle at position (11, 109).
; PLAN: r0=11(x), r1=109(y), r2=28(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 109
LDI r2, 28
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
