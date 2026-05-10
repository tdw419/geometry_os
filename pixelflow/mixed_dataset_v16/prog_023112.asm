; DESCRIPTION: Creates a red rectangular region at (356, 103) spanning 42 by 60 pixels.
; PLAN: r0=356(x), r1=103(y), r2=42(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 103
LDI r2, 42
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
