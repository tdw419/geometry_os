; DESCRIPTION: Creates a white rectangular region at (86, 214) spanning 93 by 10 pixels.
; PLAN: r0=86(x), r1=214(y), r2=93(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 214
LDI r2, 93
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
