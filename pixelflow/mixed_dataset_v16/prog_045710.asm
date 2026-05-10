; DESCRIPTION: Places a yellow 11x113 rectangle at position (92, 104).
; PLAN: r0=92(x), r1=104(y), r2=11(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 104
LDI r2, 11
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
