; DESCRIPTION: Creates a white rectangular region at (130, 186) spanning 93 by 19 pixels.
; PLAN: r0=130(x), r1=186(y), r2=93(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 186
LDI r2, 93
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
