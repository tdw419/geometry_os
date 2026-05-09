; DESCRIPTION: Creates a red rectangular region at (144, 165) spanning 82 by 64 pixels.
; PLAN: r0=144(x), r1=165(y), r2=82(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 165
LDI r2, 82
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
