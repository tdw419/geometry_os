; DESCRIPTION: Creates a red rectangular region at (447, 178) spanning 35 by 33 pixels.
; PLAN: r0=447(x), r1=178(y), r2=35(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 178
LDI r2, 35
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
