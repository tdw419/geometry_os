; DESCRIPTION: Creates a blue rectangular region at (79, 25) spanning 113 by 61 pixels.
; PLAN: r0=79(x), r1=25(y), r2=113(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 25
LDI r2, 113
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
