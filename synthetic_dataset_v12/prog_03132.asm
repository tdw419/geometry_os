; DESCRIPTION: Creates a red rectangular region at (71, 171) spanning 60 by 50 pixels.
; PLAN: r0=71(x), r1=171(y), r2=60(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 171
LDI r2, 60
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
