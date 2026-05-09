; DESCRIPTION: Places a red 40x104 rectangle at position (373, 91).
; PLAN: r0=373(x), r1=91(y), r2=40(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 91
LDI r2, 40
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
