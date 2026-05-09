; DESCRIPTION: Creates a blue rectangular region at (50, 16) spanning 86 by 10 pixels.
; PLAN: r0=50(x), r1=16(y), r2=86(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 16
LDI r2, 86
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
