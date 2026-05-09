; DESCRIPTION: Creates a black rectangular region at (295, 21) spanning 85 by 109 pixels.
; PLAN: r0=295(x), r1=21(y), r2=85(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 21
LDI r2, 85
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
