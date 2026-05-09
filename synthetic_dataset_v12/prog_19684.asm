; DESCRIPTION: Creates a red rectangular region at (381, 196) spanning 54 by 33 pixels.
; PLAN: r0=381(x), r1=196(y), r2=54(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 196
LDI r2, 54
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
