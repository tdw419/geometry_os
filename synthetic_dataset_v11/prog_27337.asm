; DESCRIPTION: Creates a yellow rectangular region at (103, 196) spanning 42 by 60 pixels.
; PLAN: r0=103(x), r1=196(y), r2=42(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 196
LDI r2, 42
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
