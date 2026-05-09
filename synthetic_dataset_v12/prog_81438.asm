; DESCRIPTION: Places a red 106x104 rectangle at position (249, 40).
; PLAN: r0=249(x), r1=40(y), r2=106(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 40
LDI r2, 106
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
