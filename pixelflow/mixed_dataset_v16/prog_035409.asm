; DESCRIPTION: Creates a blue rectangular region at (168, 121) spanning 40 by 10 pixels.
; PLAN: r0=168(x), r1=121(y), r2=40(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 121
LDI r2, 40
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
