; DESCRIPTION: Creates a red rectangular region at (18, 191) spanning 93 by 40 pixels.
; PLAN: r0=18(x), r1=191(y), r2=93(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 191
LDI r2, 93
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
