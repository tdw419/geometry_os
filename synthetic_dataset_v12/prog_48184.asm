; DESCRIPTION: Creates a red rectangular region at (171, 202) spanning 33 by 39 pixels.
; PLAN: r0=171(x), r1=202(y), r2=33(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 202
LDI r2, 33
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
