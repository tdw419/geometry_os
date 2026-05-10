; DESCRIPTION: Creates a white rectangular region at (327, 86) spanning 71 by 93 pixels.
; PLAN: r0=327(x), r1=86(y), r2=71(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 86
LDI r2, 71
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
