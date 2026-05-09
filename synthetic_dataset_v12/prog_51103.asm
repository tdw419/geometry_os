; DESCRIPTION: Creates a magenta rectangular region at (480, 165) spanning 28 by 33 pixels.
; PLAN: r0=480(x), r1=165(y), r2=28(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 165
LDI r2, 28
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
