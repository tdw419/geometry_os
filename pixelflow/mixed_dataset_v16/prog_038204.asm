; DESCRIPTION: Creates a red rectangular region at (45, 165) spanning 33 by 16 pixels.
; PLAN: r0=45(x), r1=165(y), r2=33(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 165
LDI r2, 33
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
