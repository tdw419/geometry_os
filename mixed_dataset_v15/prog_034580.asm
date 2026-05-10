; DESCRIPTION: Creates a white rectangular region at (109, 215) spanning 77 by 41 pixels.
; PLAN: r0=109(x), r1=215(y), r2=77(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 215
LDI r2, 77
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
