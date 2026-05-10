; DESCRIPTION: Creates a white rectangular region at (328, 230) spanning 107 by 11 pixels.
; PLAN: r0=328(x), r1=230(y), r2=107(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 230
LDI r2, 107
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
