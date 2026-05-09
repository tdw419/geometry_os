; DESCRIPTION: Creates a black rectangular region at (168, 46) spanning 47 by 112 pixels.
; PLAN: r0=168(x), r1=46(y), r2=47(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 46
LDI r2, 47
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
