; DESCRIPTION: Creates a white rectangular region at (368, 94) spanning 91 by 103 pixels.
; PLAN: r0=368(x), r1=94(y), r2=91(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 94
LDI r2, 91
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
