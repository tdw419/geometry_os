; DESCRIPTION: Creates a red rectangular region at (2, 94) spanning 111 by 91 pixels.
; PLAN: r0=2(x), r1=94(y), r2=111(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 94
LDI r2, 111
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
