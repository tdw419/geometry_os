; DESCRIPTION: Creates a yellow rectangular region at (354, 143) spanning 60 by 104 pixels.
; PLAN: r0=354(x), r1=143(y), r2=60(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 143
LDI r2, 60
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
