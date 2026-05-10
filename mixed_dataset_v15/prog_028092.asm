; DESCRIPTION: Creates a red rectangular region at (16, 182) spanning 56 by 40 pixels.
; PLAN: r0=16(x), r1=182(y), r2=56(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 182
LDI r2, 56
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
