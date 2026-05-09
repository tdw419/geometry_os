; DESCRIPTION: Creates a yellow rectangular region at (146, 73) spanning 40 by 54 pixels.
; PLAN: r0=146(x), r1=73(y), r2=40(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 73
LDI r2, 40
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
