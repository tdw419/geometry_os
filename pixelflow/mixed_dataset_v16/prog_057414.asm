; DESCRIPTION: Creates a yellow rectangular region at (130, 146) spanning 74 by 83 pixels.
; PLAN: r0=130(x), r1=146(y), r2=74(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 146
LDI r2, 74
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
