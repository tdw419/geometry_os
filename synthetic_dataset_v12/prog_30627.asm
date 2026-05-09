; DESCRIPTION: Places a yellow 28x72 rectangle at position (462, 55).
; PLAN: r0=462(x), r1=55(y), r2=28(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 55
LDI r2, 28
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
