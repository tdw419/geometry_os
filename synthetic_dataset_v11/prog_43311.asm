; DESCRIPTION: Creates a cyan rectangular region at (29, 106) spanning 50 by 51 pixels.
; PLAN: r0=29(x), r1=106(y), r2=50(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 106
LDI r2, 50
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
