; DESCRIPTION: Creates a red rectangular region at (86, 73) spanning 112 by 120 pixels.
; PLAN: r0=86(x), r1=73(y), r2=112(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 73
LDI r2, 112
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
