; DESCRIPTION: Creates a red rectangular region at (98, 27) spanning 112 by 111 pixels.
; PLAN: r0=98(x), r1=27(y), r2=112(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 27
LDI r2, 112
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
