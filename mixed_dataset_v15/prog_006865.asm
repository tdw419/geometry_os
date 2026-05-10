; DESCRIPTION: Creates a orange rectangular region at (346, 120) spanning 116 by 104 pixels.
; PLAN: r0=346(x), r1=120(y), r2=116(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 120
LDI r2, 116
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
