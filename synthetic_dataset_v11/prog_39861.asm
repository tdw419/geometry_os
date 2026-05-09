; DESCRIPTION: Creates a black rectangular region at (113, 98) spanning 109 by 104 pixels.
; PLAN: r0=113(x), r1=98(y), r2=109(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 98
LDI r2, 109
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
