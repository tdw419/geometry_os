; DESCRIPTION: Creates a red rectangular region at (130, 196) spanning 67 by 52 pixels.
; PLAN: r0=130(x), r1=196(y), r2=67(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 196
LDI r2, 67
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
