; DESCRIPTION: Creates a white rectangular region at (215, 77) spanning 65 by 111 pixels.
; PLAN: r0=215(x), r1=77(y), r2=65(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 77
LDI r2, 65
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
