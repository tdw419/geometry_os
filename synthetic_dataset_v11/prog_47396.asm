; DESCRIPTION: Creates a cyan rectangular region at (10, 140) spanning 116 by 111 pixels.
; PLAN: r0=10(x), r1=140(y), r2=116(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 140
LDI r2, 116
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
