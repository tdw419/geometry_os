; DESCRIPTION: Creates a yellow rectangular region at (213, 146) spanning 64 by 38 pixels.
; PLAN: r0=213(x), r1=146(y), r2=64(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 146
LDI r2, 64
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
