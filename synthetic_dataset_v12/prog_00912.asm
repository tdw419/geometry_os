; DESCRIPTION: Creates a red rectangular region at (74, 112) spanning 111 by 107 pixels.
; PLAN: r0=74(x), r1=112(y), r2=111(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 112
LDI r2, 111
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
