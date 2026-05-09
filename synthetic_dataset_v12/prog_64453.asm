; DESCRIPTION: Creates a white rectangular region at (256, 187) spanning 72 by 58 pixels.
; PLAN: r0=256(x), r1=187(y), r2=72(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 187
LDI r2, 72
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
