; DESCRIPTION: Creates a blue rectangular region at (327, 173) spanning 11 by 80 pixels.
; PLAN: r0=327(x), r1=173(y), r2=11(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 173
LDI r2, 11
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
