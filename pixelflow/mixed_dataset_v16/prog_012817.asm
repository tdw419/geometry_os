; DESCRIPTION: Creates a blue rectangular region at (202, 164) spanning 77 by 74 pixels.
; PLAN: r0=202(x), r1=164(y), r2=77(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 164
LDI r2, 77
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
