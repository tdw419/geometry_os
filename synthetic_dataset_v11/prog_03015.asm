; DESCRIPTION: Creates a red rectangular region at (187, 60) spanning 33 by 18 pixels.
; PLAN: r0=187(x), r1=60(y), r2=33(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 60
LDI r2, 33
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
