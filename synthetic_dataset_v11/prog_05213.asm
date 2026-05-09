; DESCRIPTION: Creates a red rectangular region at (5, 174) spanning 111 by 21 pixels.
; PLAN: r0=5(x), r1=174(y), r2=111(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 174
LDI r2, 111
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
