; DESCRIPTION: Creates a yellow rectangular region at (262, 111) spanning 58 by 112 pixels.
; PLAN: r0=262(x), r1=111(y), r2=58(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 111
LDI r2, 58
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
