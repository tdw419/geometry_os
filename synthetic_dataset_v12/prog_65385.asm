; DESCRIPTION: Creates a green rectangular region at (368, 168) spanning 103 by 41 pixels.
; PLAN: r0=368(x), r1=168(y), r2=103(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 168
LDI r2, 103
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
