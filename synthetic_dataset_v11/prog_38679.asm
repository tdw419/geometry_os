; DESCRIPTION: Creates a red rectangular region at (77, 59) spanning 111 by 57 pixels.
; PLAN: r0=77(x), r1=59(y), r2=111(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 59
LDI r2, 111
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
