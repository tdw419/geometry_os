; DESCRIPTION: Creates a yellow rectangular region at (107, 8) spanning 104 by 120 pixels.
; PLAN: r0=107(x), r1=8(y), r2=104(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 8
LDI r2, 104
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
