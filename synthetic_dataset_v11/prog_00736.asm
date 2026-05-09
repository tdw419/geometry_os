; DESCRIPTION: Creates a magenta rectangular region at (142, 130) spanning 42 by 56 pixels.
; PLAN: r0=142(x), r1=130(y), r2=42(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 130
LDI r2, 42
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
