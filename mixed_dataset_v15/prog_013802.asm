; DESCRIPTION: Creates a red rectangular region at (346, 5) spanning 22 by 104 pixels.
; PLAN: r0=346(x), r1=5(y), r2=22(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 5
LDI r2, 22
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
