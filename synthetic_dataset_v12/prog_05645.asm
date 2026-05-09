; DESCRIPTION: Creates a black rectangular region at (295, 178) spanning 29 by 70 pixels.
; PLAN: r0=295(x), r1=178(y), r2=29(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 178
LDI r2, 29
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
