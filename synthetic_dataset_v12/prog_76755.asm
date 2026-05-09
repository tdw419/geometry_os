; DESCRIPTION: Creates a red rectangular region at (373, 13) spanning 111 by 86 pixels.
; PLAN: r0=373(x), r1=13(y), r2=111(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 13
LDI r2, 111
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
