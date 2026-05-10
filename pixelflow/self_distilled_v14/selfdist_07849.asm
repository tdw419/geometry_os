; DESCRIPTION: Places a red 12x104 box at position (4, 164).
; PLAN: r0=4(x), r1=164(y), r2=12(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 164
LDI r2, 12
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
