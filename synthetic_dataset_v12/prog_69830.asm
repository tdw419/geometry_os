; DESCRIPTION: Creates a red rectangular region at (191, 171) spanning 51 by 47 pixels.
; PLAN: r0=191(x), r1=171(y), r2=51(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 171
LDI r2, 51
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
