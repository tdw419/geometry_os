; DESCRIPTION: Creates a red rectangular region at (130, 208) spanning 83 by 48 pixels.
; PLAN: r0=130(x), r1=208(y), r2=83(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 208
LDI r2, 83
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
