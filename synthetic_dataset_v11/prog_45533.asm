; DESCRIPTION: Creates a green rectangular region at (197, 56) spanning 41 by 103 pixels.
; PLAN: r0=197(x), r1=56(y), r2=41(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 56
LDI r2, 41
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
