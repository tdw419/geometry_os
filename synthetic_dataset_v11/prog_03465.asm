; DESCRIPTION: Creates a white rectangular region at (187, 135) spanning 32 by 87 pixels.
; PLAN: r0=187(x), r1=135(y), r2=32(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 135
LDI r2, 32
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
