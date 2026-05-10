; DESCRIPTION: Places a blue 29x58 rectangle at position (380, 124).
; PLAN: r0=380(x), r1=124(y), r2=29(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 124
LDI r2, 29
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
