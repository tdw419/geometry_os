; DESCRIPTION: Creates a cyan rectangular region at (111, 112) spanning 43 by 72 pixels.
; PLAN: r0=111(x), r1=112(y), r2=43(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 112
LDI r2, 43
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
