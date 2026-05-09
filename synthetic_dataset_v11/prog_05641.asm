; DESCRIPTION: Creates a white rectangular region at (202, 46) spanning 25 by 117 pixels.
; PLAN: r0=202(x), r1=46(y), r2=25(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 46
LDI r2, 25
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
