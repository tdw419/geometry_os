; DESCRIPTION: Creates a cyan rectangular region at (68, 111) spanning 114 by 51 pixels.
; PLAN: r0=68(x), r1=111(y), r2=114(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 111
LDI r2, 114
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
