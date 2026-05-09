; DESCRIPTION: Places a cyan 104x106 rectangle at position (399, 92).
; PLAN: r0=399(x), r1=92(y), r2=104(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 92
LDI r2, 104
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
