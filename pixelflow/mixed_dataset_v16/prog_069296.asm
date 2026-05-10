; DESCRIPTION: Creates a white rectangular region at (398, 177) spanning 21 by 60 pixels.
; PLAN: r0=398(x), r1=177(y), r2=21(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 177
LDI r2, 21
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
