; DESCRIPTION: Creates a red rectangular region at (104, 203) spanning 75 by 27 pixels.
; PLAN: r0=104(x), r1=203(y), r2=75(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 203
LDI r2, 75
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
