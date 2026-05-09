; DESCRIPTION: Creates a yellow rectangular region at (275, 27) spanning 74 by 65 pixels.
; PLAN: r0=275(x), r1=27(y), r2=74(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 27
LDI r2, 74
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
